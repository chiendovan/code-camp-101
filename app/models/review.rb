
# app/models/review.rb
class Review < ApplicationRecord
  belongs_to :book
end