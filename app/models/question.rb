class Question
  include Mongoid::Document
  field :body, type: String
  field :answers, type: Array
  field :correct_answer, type: Integer
  # field :reminders, type: String

  embedded_in :section
  has_many :experiences, as: :experienceable
  belongs_to :section
end
