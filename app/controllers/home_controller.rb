class HomeController < ApplicationController
  def index;end

  def creating_site;end

  def turnkey_site
    render 'home/creating_site'
  end

  def create_site
    render 'home/creating_site'
  end

  def creating_scratch_site
    render 'home/creating_site'
  end

  def web_studio
    render 'home/creating_site'
  end

  def order_site
    render 'home/creating_site'
  end

  def create_shop
    render 'home/creating_site'
  end

  def development_site
    render 'home/creating_site'
  end

end
