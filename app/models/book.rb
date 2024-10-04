# app/models/book.rb
class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
