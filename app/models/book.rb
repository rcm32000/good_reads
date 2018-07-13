class Book < ApplicationRecord
  has_many :reviews

  def highest_review
    binding.pry
  end
end
