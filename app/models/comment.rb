class Comment < ApplicationRecord
  belongs_to:article
  validates :name, presence: true
  validates :body, presence: true
  validates_presence_of :article_id
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: I18n.t('comment_attributes.email') }


end
