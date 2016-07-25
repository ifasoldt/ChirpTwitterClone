class Tildetagging < ApplicationRecord
  belongs_to :tweet
  belongs_to :tildetag
end
