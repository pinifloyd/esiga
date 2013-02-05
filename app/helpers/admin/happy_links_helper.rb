module Admin::HappyLinksHelper

  def content_with_icon(content, icon)
    safe_join([ content_tag(:i, nil, class: icon), t(content) ])
  end

  def new_button(path, options = {})
    link_class = 'btn btn-small btn-success'
    
    if options[:link_class]
      link_class = [ link_class, options[:link_class] ].join(' ')
    end

    link_to(path, class: link_class) do
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

  def cancel_button(path)
    link_to(t('.cancel'), path, class: 'btn btn-small')
  end

  def submit_button
    link_to('#', class: 'btn btn-small btn-success x_submit_btn') do
      content_with_icon('.submit', 'icon-ok')
    end
  end

end
