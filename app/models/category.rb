class Category < ApplicationRecord

  def self.random
  @categories = Category.all
  @categories.sample
  end

end
