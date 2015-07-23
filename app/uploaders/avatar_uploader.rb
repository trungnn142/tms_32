# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/no-avatar.png")
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :medium do
    process resize_to_fit: [200, 200]
  end

  version :icon do
    process resize_to_fit: [40, 40]
  end

end
