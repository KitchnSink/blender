class Player
  include Mongoid::Document
  field :gamedata, type: Hash
  field :status, type: String
  field :achievements, type: Array, default: []
  field :experience, type: Integer, default: 0

  embedded_in :user
end
