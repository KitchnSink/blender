class Lesson
  include Mongoid::Document
  mount_uploader :image, LessonUploader
  field :title, type: String
  field :body, type: String
  field :order, type: String, default: 1

  has_many :sections
  has_many :experiences, as: :experienceable

  accepts_nested_attributes_for :sections, allow_destory: true

  def experience
    # self.sections.inject do |section, section|
    #   sum + section.experience
    # end
  end

end
