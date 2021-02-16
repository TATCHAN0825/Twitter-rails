module ApplicationHelper
  def screen_name_with_at(screen_name)
    '@' + screen_name
  end

  def user_path(user)
    '/' + user.screen_name
  end

  def user_link(user)
    link_to current_user.name + '(' + screen_name_with_at(current_user.screen_name) + ')', user_path(user)
  end
end
