module ContentHelper

  def not_found_message
    content_tag :div, t('.not_found'), class: 'alert'
  end

end
