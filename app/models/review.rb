class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  def self.avg_rating
    average(:rating)
  end
end
