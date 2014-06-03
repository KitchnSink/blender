class Question
  include Mongoid::Document
  field :body, type: String

  embedded_in :question
end
