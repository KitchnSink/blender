class Lesson
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :body, type: String
  field :order, type: String, default: 1

  embeds_many :sections
  has_many :experiences, as: :experienceable

  def experience
    @calculated_experience = @calculated_experience || self.sections.pluck(:experience).inject(0, :+)
  end

end
