module ApplicationHelper
  def screen_name_with_at(screen_name)
    '@' + screen_name
  end

  def user_path(user)
    '/' + user.screen_name
  end
end
