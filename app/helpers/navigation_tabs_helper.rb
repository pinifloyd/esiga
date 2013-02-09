module NavigationTabsHelper

  def nav_tabs
    return if all_categories.blank?

    content_tag :ul, class: 'nav nav-tabs nav-stacked' do
      safe_join \
        all_categories.map{ |category| nav_tab(category) }
    end
  end

  private

  def nav_tab(category)
    icon_class = 'icon-chevron-right pull-right'

    content = safe_join([
      content_tag(:i, nil, class: icon_class), category.name
    ])

    content_tag :li, current_tab(category) do
      link_to content, category_path(category)
    end
  end

  def current_tab(category)
    if category == current_category
      return { class: 'active' }
    end
  end

end
