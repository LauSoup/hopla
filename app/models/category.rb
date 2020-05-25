class Category < ApplicationRecord
  has_many :tags
  has_many :shops, through: :tags
  validates :name, presence: true
end
