class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploaders :photos, PhotoUploader
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_address
    [address, city].join(', ')
  end
end
