class Photo < ApplicationRecord
  mount_uploader :url, PhotoUploader

  belongs_to :flat
  validates :url, presence: true
  validates :flat_id, presence: true, allow_blank: false
end
