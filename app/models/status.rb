class Status
  include Mongoid::Document

  attr_readable :total_experience

  after_create :get_next_available_lesson

  field :total_hearts, type: Integer, default: 10
  field :max_hearts, type: Integer, default: 10

  has_one :next_available_lesson, class_name: "Lesson"
  embedded_in :player

  def total_experience
    @total_experience = @total_experience || calc_total_experience
  end

  def calc_total_experience
    self.experience.inject do |sum, experience|
      sum + experience.earned
    end
  end

  private

    def add_next_available_lesson
      self.next_available_lesson = Lesson.first
    end
end
