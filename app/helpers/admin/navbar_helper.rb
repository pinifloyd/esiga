module Admin::NavbarHelper

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
    { dashboard:  admin_root_path,
      categories: admin_categories_path }
  end

  def navbar_right_items
    { front_end: root_path,
      sign_out:  destroy_user_session_path }
  end

  def navbar_item(name, url)
    scope = [ :admin, :shared, :navbar ]

    content_tag :li, current_item?(name) do
      link_to t(name, scope: scope), url
    end
  end

  def current_item?(name)
    if controller_name == name.to_s
      return { class: 'active' }
    end
  end

end
