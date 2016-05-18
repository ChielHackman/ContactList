class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :thumbnail do
    eager
    resize_to_fit(300, 300)
    cloudinary_transformation :quality => 80
  end

  def default_public_id
      'http://res.cloudinary.com/chielhackman/image/upload/v1463550537/default_m75eff.png'
  end

end
