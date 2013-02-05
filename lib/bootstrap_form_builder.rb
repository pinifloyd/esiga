class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

  delegate :content_tag, :safe_join, to: :@template

  CSS = {
    input:     'controls',
    error:     'error',
    message:   'help-inline',
    container: %w(control-group),
    label:     %w(control-label),
    required:  %w(label label-important)
  }

  def text_field(method, options = {})
    content_tag(:div, class: CSS[:input]) do
      safe_join([
        super(method, options), error_message(method, options)
      ])
    end
  end

  def label(method, *args, &block)
    options = args.extract_options!

    options[:class] = \
      fetch_item_class(:label, options[:class])

    super(method, *(args << options), &block)
  end

  def required_label(method, *args, &block)
    unless args.first.blank? || args.first.is_a?(Hash)
      args.unshift \
        content_tag(:span, args.shift, class: CSS[:required])
    end

    label(method, *args, &block)
  end

  def fields_container(method, &block)
    unless object.errors[method].blank?
      container_class = \
        fetch_item_class(:container, CSS[:error])
    end

    content_tag(:div, class: container_class, &block)
  end

  private

  def error_message(method, options)
    return if options.delete(:without_error)

    message = object.errors[method].try(:first)

    unless message.blank?
      content_tag(:span, message, class: CSS[:message])
    end
  end

  def fetch_item_class(item, custom_class)
    item_class = CSS[item]

    if custom_class.is_a?(String)
      item_class |= custom_class.split
    end

    safe_join(item_class, ' ')
  end

end
