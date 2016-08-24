class HomeController < ApplicationController
  def index;end

  def creating_site;end

  [:turnkey_site,
   :create_site,
   :creating_scratch_site,
   :web_studio,
   :order_site,
   :create_shop,
   :create_shop,
   :development_site,
   :order_landing_page,
   :development_site_landing_page_web_design,
   :order_shop,
   :order_card_site].each do |method|
    define_method method do
      render 'home/creating_site'
    end
  end

end
