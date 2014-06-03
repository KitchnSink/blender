class Status
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  after_create :get_next_available_lesson

  field :total_hearts, type: Integer, default: 10
  field :max_hearts, type: Integer, default: 10

  has_one :next_available_lesson, class_name: "Lesson"
  embedded_in :player

  def total_experience
    @calculated_total_experience = @total_experience || calc_total_experience
  end

  def calc_total_experience
    self.experience.pluck(:earned).inject(0, :+)
  end

  private

    def add_next_available_lesson
      self.next_available_lesson = Lesson.first
    end
end
