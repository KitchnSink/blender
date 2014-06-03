class Question
  include Mongoid::Document
  field :body, type: String
  # field :answers, type: Array
  field :correct_answer, type: Integer
  field :experience, type: Integer
  # field :reminders, type: String

  embedded_in :section
  embeds_many :answers
  # has_many :experiences, as: :experienceable

  accepts_nested_attributes_for :answers, allow_destory: true
end
