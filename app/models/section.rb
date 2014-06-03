class Section
  include Mongoid::Document
  field :body, type: String
  field :metadata, type: String

  has_many :questions
  belongs_to :lesson
end
