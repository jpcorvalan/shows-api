class ShowSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :rating, :characters

  has_many :characters, serializer: SimpleCharacterSerializer
end
