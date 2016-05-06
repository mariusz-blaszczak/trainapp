class Exercise < ActiveRecord::Base
  mount_uploader :audio, AudioUploader
end
