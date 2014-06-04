class Player
  include Mongoid::Document

  before_create :add_status
  field :gamedata, type: Hash, default: {}

  embedded_in :user
  embeds_one :status, validate: false
  # has_and_belongs_to_many :achievements, validate: false
  has_many :experience, validate: false

  def total_experience
    self.experience.pluck(:earned).inject(0, :+)
  end

  def update_gamedata lesson

    # get user experience for all questions
    self.gamedata[lesson.id] = {
      experience_earned: lesson.player_experience(self, true)
    }

    self.save
  end

  private

    def add_status
      # create player status object with defaults
      self.status = Status.new(next_available_lesson: Lesson.order_by(:order.asc).first.id.to_s)
    end

end
