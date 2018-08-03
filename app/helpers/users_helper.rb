module UsersHelper
  def gravatar_for user
    email = Email.find_by user_id: user.id
    gravatar_id = Digest::MD5::hexdigest email.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end
end
