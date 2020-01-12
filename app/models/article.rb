class Article < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :user, optional: true

  has_many :images, foreign_key: :article_id, dependent: :destroy
  accepts_nested_attributes_for :images
end
