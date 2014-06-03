class Lesson
  include Mongoid::Document

  after_initialize :add_slug

  mount_uploader :image, LessonUploader
  field :title, type: String
  field :slug, type: String
  field :body, type: String
  field :order, type: String, default: 1
  field :_id, type: String, default: ->{ title.to_s.parameterize }

  attr_readonly :experience

  embeds_many :sections
  has_many :experiences, as: :experienceable

  accepts_nested_attributes_for :sections, allow_destory: true

  validates :title, uniqueness: true

  def experience
    @calculated_experience = @calculated_experience || self.sections.pluck(:experience).inject(0, :+)
  end

  private

    def add_slug
      self.slug = self.title.parameterize
    end

end
