class ShowSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :rating, :characters
end
