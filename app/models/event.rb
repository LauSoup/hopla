class Event < ApplicationRecord
  belongs_to :shop
  has_many :favorites_events
  has_many :users, through: :favorites_events
  has_many_attached :photos

  CATEGORIES = ["Evènement", "Promotion"]
  validates :title, :beg_date, :end_date, :category, presence: true
  validates :offer, presence: true, if: -> {
    category == "Promotion"
  }
  validates :category, inclusion: { in: CATEGORIES }
  # has_one_attached :photo

  def self.random
    @events = Event.all
    @events.sample
  end

end
