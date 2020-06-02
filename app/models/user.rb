class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one_attached :avatar
  has_many :favorite_events
  has_many :events, through: :favorite_events

  def self.random
    @user = User.all
    @user.sample
  end

end
