class PhotoBlogUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  version :display do
    process eager: true
  end
end
