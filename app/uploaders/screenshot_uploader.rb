class ScreenshotUploader < CarrierWave::Uploader::Base
  storage :file
  def extension_whitelist
    %w[jig png]
  end

  def content_type_allowlist
    [/image\//]
  end

end
