module NavigationTabsHelper

  def nav_tabs
    return if nav_categories.blank?

    content_tag :ul, class: 'nav nav-tabs nav-stacked' do
      safe_join \
        nav_categories.map{ |category| nav_tab(category) }
    end
  end

  private

  def nav_tab(category)
    icon_class = 'icon-chevron-right pull-right'

    content = safe_join([
      content_tag(:i, nil, class: icon_class), category.name
    ])

    content_tag :li do
      link_to content, category_path(category)
    end
  end

end
