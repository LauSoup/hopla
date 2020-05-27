class Shop < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :events
  has_many :categories, through: :tags
  validates :name, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_category,
    associated_against: {
      categories: [:id]
    }
  
end
