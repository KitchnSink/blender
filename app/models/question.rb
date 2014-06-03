class Question
  include Mongoid::Document
  field :text, type: String
  field :answers, type: Array
  field :correct_answer, type: Integer
  # field :reminders, type: String

  # embedded_by :section
  has_many :experiences, as: :experienceable
end
