class Event < ApplicationRecord
  belongs_to :shop
  has_many :favorite_events
  has_many :users, through: :favorite_events
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

  def generate_qr_code
    if qr_code.nil?
      RQRCode::QRCode.new("default")
    else
      RQRCode::QRCode.new(qr_code)
    end
  end

end
