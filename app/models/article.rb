class Article < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :likes
  accepts_nested_attributes_for :comments, allow_destroy: true
  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end 

end
