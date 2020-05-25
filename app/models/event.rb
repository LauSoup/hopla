class Event < ApplicationRecord
  belongs_to :shop

  def self.random
    @events = Event.all
    @events.sample
    end
  
end
