class Experience
  include Mongoid::Document
  field :total, type: String
  field :earned, type: String

  belongs_to :user
  belongs_to :experienceable, polymorphic: true

  # def experience
  #   @calculated_experience = @calculated_experience || self.questions.pluck(:experience).inject(0, :+)
  # end
end
