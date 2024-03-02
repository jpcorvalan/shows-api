class Show < ApplicationRecord
  has_and_belongs_to_many :characters

  validates :image, presence: true
  validates :rating, presence: true
  validates :title, presence: true
end
