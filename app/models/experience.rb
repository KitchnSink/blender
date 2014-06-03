class Experience
  include Mongoid::Document
  field :total, type: Integer
  field :earned, type: Integer

  belongs_to :player
  belongs_to :experienceable, polymorphic: true

  # def experience
  #   @calculated_experience = @calculated_experience || self.questions.pluck(:experience).inject(0, :+)
  # end
end
