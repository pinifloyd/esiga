module BootstrapFormHelper

  def horizontal_form_class(custom_class)
    form_class = %w(form-horizontal)
    
    if custom_class.respond_to?(:split)
      form_class |= custom_class.split
    end

    safe_join(form_class, ' ')
  end

  def horizontal_form_for(record, *args, &block)
    options = args.extract_options!

    options[:html] ||= {}

    options[:html][:class] = \
      horizontal_form_class(options[:html][:class])

    args << options.merge(builder: BootstrapFormBuilder)

    form_for(record, *args, &block)
  end

end
