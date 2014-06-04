class Lesson
  include Mongoid::Document

  after_initialize :add_slug

  mount_uploader :image, LessonUploader
  field :title, type: String
  field :slug, type: String
  field :body, type: String
  field :order, type: String, default: 1
  field :_id, type: String, default: ->{ title.to_s.parameterize }

  attr_readonly :experience, :questions, :player_experience

  embeds_many :sections
  has_many :experiences, as: :experienceable

  accepts_nested_attributes_for :sections, allow_destory: true

  validates :title, uniqueness: true

  def questions
    if !@loaded_questions
      @loaded_questions = []
      self.sections.each do |section|
        @loaded_questions.concat section.questions
      end
    end
    @loaded_questions
  end

  def experience
    @calculated_experience = @calculated_experience || self.questions.inject(0) { |sum, question| sum + question.experience }
  end

  def player_experience player, recalc = false
    self.player_experiences(player, recalc).inject(0) { |sum, exp| (sum + exp.earned) if exp }
  end

  def player_experiences player, recalc = false
    if @loaded_experiences.blank? || recalc == true
      @loaded_experiences = self.questions.map do |question|
        question.experiences.where(player: player).first
      end
    end

    @loaded_experiences
  end

  def player_grade player, recalc = false
    ((player_experience(player).to_f / experience.to_f) * 100).round.to_i
  end

  private

    def add_slug
      self.slug = self.title.parameterize
    end

end
