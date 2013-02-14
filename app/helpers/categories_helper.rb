module CategoriesHelper

  def categories_nav
    content_tag :ul, class: 'nav nav-tabs nav-stacked' do
      safe_join \
        @categories.map{ |category| category_tab(category) }
    end
  end

  private

  def category_tab(category)
    icon_class = 'chevron-right pull-right'

    content = safe_join([
      glyph(icon_class), category.name
    ])

    content_tag :li, current_tab(category) do
      link_to content, category_path(category)
    end
  end

  def current_tab(category)
    if category == @category
      return { class: 'active' }
    end
  end

end
