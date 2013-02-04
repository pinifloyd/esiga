module Admin::HappyLinksHelper

  def content_with_icon(content, icon)
    safe_join([ content_tag(:i, nil, class: icon), t(content) ])
  end

  def new_button_header(path)
    link_to(path, class: 'btn btn-small btn-success pull-right') do
      content_with_icon('.add_new', 'icon-plus')
    end
  end

  def edit_button(path)
    link_to(path, class: 'btn btn-small btn-warning') do
      content_with_icon('admin.base.edit', 'icon-edit')
    end
  end

  def delete_button(path)
    link_to(path, method: :delete, class: 'btn btn-small btn-danger') do
      content_with_icon('admin.base.delete', 'icon-trash')
    end
  end

end
