class Flat < ApplicationRecord
  belongs_to :user
  mount_uploaders :photos, PhotoUploader
end
