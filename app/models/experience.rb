class Experience
  include Mongoid::Document
  field :total, type: String
  field :earned, type: String

  belongs_to :user
  belongs_to :experienceable, polymorphic: true
end
