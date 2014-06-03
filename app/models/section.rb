class Section
  include Mongoid::Document
  field :body, type: String
  field :metadata, type: String

  embeds_many :questions
  embedded_in :lesson
end
