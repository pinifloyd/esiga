module Common::ContentHelper

  def not_found_message
    content_tag :div, t('.not_found'), class: 'alert'
  end

  def currency_price(price)
    number_to_currency price,
      unit: 'BYR', format: '%n %u', precision: 0
  end

end
