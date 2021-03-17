module ApplicationHelper
  def screen_name_with_at(screen_name)
    '@' + screen_name
  end

  def user_link(user)
    link_to user.name + '(' + screen_name_with_at(user.screen_name) + ')', user_path(user.screen_name)
  end

  def user_image_path(user)
    if user.image?
      user.image.url
    else
      "Initialicon.png"
    end
  end
end
