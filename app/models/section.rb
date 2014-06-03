class Section
  include Mongoid::Document
  field :body, type: String
  field :metadata, type: Hash

  embeds_many :questions
end
