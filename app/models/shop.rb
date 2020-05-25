class Shop < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :events
  has_many :categories, through: :tags
  validates :name, :address, presence: true
end
