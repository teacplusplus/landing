module ApplicationHelper
  def home_page?
    action_name == 'index'
  end
end
