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

  def replace_screen_name_to_link(text)
    # 最初にエスケープすることでこれから追加するタグだけは残る
    text = html_escape(text)

    text.scan(/@[a-zA-Z_\d]{4,15}/).each do |screen_name|
      screen_name.gsub!('@', '')
      if User.find_by(screen_name: screen_name)
        text.gsub!('@' + screen_name, link_to('@' + screen_name, user_path(screen_name: screen_name)))
      end
    end
    text
  end
end
