module Admin::ContentHelper

  def page_header(new_item_path = nil)
    content = [ t('.page_header') ]

    if new_item_path
      content << new_button(new_item_path, link_class: 'pull-right')
    end

    content_tag(:div, class: 'page-header') do
      content_tag(:h1, safe_join(content))
    end
  end

  def form_actions(path)
    content_tag(:div, class: 'form-actions') do
      safe_join([ submit_button, ' ', cancel_button(path) ])
    end
  end

  def alert_not_found
    content_tag(:div, t('.not_found'), class: 'alert')
  end

  def items_list(items)
    items.empty? ? alert_not_found : render('items')
  end

end
