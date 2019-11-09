class Article < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :user, optional: true

  validates :text, presence: true, unless: :image?
  mount_uploaders :images, ImageUploader
  serialize :image, JSON
end
