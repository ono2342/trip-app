class Article < ApplicationRecord
  belongs_to :country
  belongs_to :user

  has_many :images
end
