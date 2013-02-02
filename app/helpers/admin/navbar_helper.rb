module Admin::NavbarHelper

  def navbar_menu_items
    { dashboard:  admin_root_path,
      categories: admin_categories_path }
  end

  def navbar_menu_item(name, url)
    content_tag :li, navbar_item_active?(name) do
      link_to t(name, scope: [ :admin, :navbar ]), url
    end
  end

  def navbar_item_active?(name)
    if controller_name == name.to_s
      return { class: 'active' }
    end
  end

  def navbar_menu
    safe_join(navbar_menu_items.map do |name, url|
      navbar_menu_item(name, url)
    end)
  end

end
