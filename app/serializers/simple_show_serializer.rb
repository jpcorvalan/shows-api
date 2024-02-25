class SimpleShowSerializer < ActiveModel::Serializer
  attributes :image, :title, :created_at
end
