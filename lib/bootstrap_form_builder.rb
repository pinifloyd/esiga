class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

  delegate :content_tag, :safe_join, to: :@template

  CSS = {
    input:     %w(controls),
    error:     %w(error),
    message:   %w(help-inline),
    container: %w(control-group),
    label:     %w(control-label),
    required:  %w(label label-important)
  }

  FORM_FIELDS = %w(text_field number_field collection_select select)

  FORM_FIELDS.each do |form_field|
    define_method(form_field) do |method, *args|
      options = args.extract_options!

      content_tag(:div, item_class(:input)) do
        safe_join([
          super(method, *(args << options)),
          error_message(method, options)
        ])
      end
    end
  end

  def label(method, *args, &block)
    options = args.extract_options!

    options.merge! \
      item_class(:label, options[:class])

    super(method, *(args << options), &block)
  end

  def required_label(method, *args, &block)
    unless args.first.blank? || args.first.is_a?(Hash)
      args.unshift \
        content_tag(:span, args.shift, item_class(:required))
    end

    label(method, *args, &block)
  end

  def fields_container(method, &block)
    container_class = item_class :container,
      object.errors[method].blank? ? nil : CSS[:error]

    content_tag(:div, container_class, &block)
  end

  private

  def error_message(method, options)
    return if options.delete(:without_error)

    message = object.errors[method].try(:first)

    unless message.blank?
      content_tag(:span, message, item_class(:message))
    end
  end

  def item_class(item, custom_class = nil)
    custom_class = custom_class.is_a?(Hash) ? \
      nil : Array.wrap(custom_class).split.flatten

    item_class = safe_join (CSS[item] | custom_class), ' '

    return { class:  item_class }
  end

end
