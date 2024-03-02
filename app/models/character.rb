class Character < ApplicationRecord
  has_and_belongs_to_many :shows

  validates :age, presence: true
  validates :history, presence: true
  validates :image, presence: true
  validates :name, presence: true
  validates :weight, presence: true
end
