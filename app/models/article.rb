class Article < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :likes
  accepts_nested_attributes_for :comments, allow_destroy: true
end
