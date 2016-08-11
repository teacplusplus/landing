module ApplicationHelper
  def home_page?
    action_name == 'index'
  end

  def i18n_exist? key
    I18n.t key, :raise => true rescue false
  end
end
