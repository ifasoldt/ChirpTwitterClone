class Tildetag < ApplicationRecord
  has_many :tildetaggings
  has_many :tweets, through: :tildetaggings
end
