if Rails.env.production?
  CarrierWave.configure do |config|
    #config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['S3_ACCESS_KEY'],         # required
      aws_secret_access_key: ENV['S3_SECRET_KEY'],         # required
      region:                ENV['S3_REGION']              # optional, defaults to 'us-east-1'
    }
    config.fog_directory   = ENV['S3_BUCKET']              # required
  end
end

# for Filenames and unicode chars
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

module CarrierWave
  module MiniMagick
    # Rotates the image based on the EXIF Orientation
    # https://gist.github.com/jcsrb/1510601
    # http://qiita.com/ppworks/items/ae479c036d25b3e7b120
    def fix_exif_rotation
      manipulate! do |img|
        img.auto_orient
        yield(img) if block_given?
        img
      end
    end
  end
end
