class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :age, :weight, :history

  has_many :shows, serializer: SimpleShowSerializer

end
