class Character < ApplicationRecord
  has_and_belongs_to_many :shows
end
