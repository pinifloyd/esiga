module NavigationHelper

  def navbar_left_menu
    content_tag :ul, class: 'nav' do
      safe_join \
        navbar_left_items.map{ |name, url| navbar_item(name, url) }
    end
  end

  def navbar_right_menu
    content_tag :ul, class: 'nav pull-right' do
      safe_join \
        navbar_right_items.map{ |name, url| navbar_item(name, url) }
    end
  end

  private

  def navbar_left_items
    { home:       root_path,
      categories: categories_path }
  end

  def navbar_right_items
    if current_user
      { admin_cms: admin_root_path,
        sign_out:  destroy_user_session_path }
    else
      { sign_in:   new_user_session_path }
    end
  end

  def navbar_item(name, url)
    scope = [ :shared, :navbar ]

    content_tag :li, current_item(name) do
      link_to t(name, scope: scope), url
    end
  end

  def current_item(name)
    if controller_name == name.to_s
      return { class: 'active' }
    end
  end

end
