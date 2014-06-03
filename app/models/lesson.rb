class Lesson
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  mount_uploader :image, LessonUploader
  field :title, type: String
  field :body, type: String
  field :order, type: String, default: 1

  embeds_many :sections
  has_many :experiences, as: :experienceable

  accepts_nested_attributes_for :sections, allow_destory: true

  def experience
    @calculated_experience = @calculated_experience || self.sections.pluck(:experience).inject(0, :+)
  end

end
