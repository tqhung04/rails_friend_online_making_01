class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  version :display do
    process eager: true
    process resize_to_fill: [200, 200, :north]
  end

  def default_url(*args)
    "/images/" + [version_name, "avatar-default.png"].compact.join('_')
  end
end
