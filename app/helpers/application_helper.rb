module ApplicationHelper

  include BootstrapFormHelper

  def authentication_error_messages
    return '' if resource.errors.empty?

    content_tag(:div, class: 'alert fage in alert-error') do
      safe_join([
        content_tag(:button, raw('&times;'), class: 'close', data: { dismiss: 'alert' }),
        content_tag(:h4, t('base.warning')),
        resource.errors.full_messages.map { |msg| msg }.join('\n')
      ])
    end
  end

end
