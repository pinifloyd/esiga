module Admin::BaseHelper

  include Admin::NavbarHelper

  def add_button_header(url)
    link_to url, class: 'btn btn-success pull-right' do
      safe_join([
        content_tag( :i, nil, class: 'icon-plus'), t('.add_new')
      ])
    end
  end

end
