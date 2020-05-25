class Shop < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :events
  has_many :categories, through: :tags
  validates :name, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end
