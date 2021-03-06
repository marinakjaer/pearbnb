class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  validates :address, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :max_guest, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_address
    [address, city].join(', ')
  end

end
