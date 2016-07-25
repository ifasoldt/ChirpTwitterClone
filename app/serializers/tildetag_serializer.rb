class TildetagSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tweets
end
