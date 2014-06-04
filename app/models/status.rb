class Status
  include Mongoid::Document

  field :total_hearts, type: Integer, default: 10
  field :max_hearts, type: Integer, default: 10
  field :next_available_lesson, type: String

  embedded_in :player

  def decrease_hearts n = 1
    increment_hearts n * -1
  end

  def increase_hearts n = 1
    increment_hearts n
  end

  def total_experience
    @calculated_total_experience = @total_experience || calc_total_experience
  end

  def calc_total_experience
    self.experience.pluck(:earned).inject(0, :+)
  end

  def update_next_lesson
    @current_lesson = Lesson.find(self.next_available_lesson)
    self.update(next_available_lesson: Lesson.asc(:order).skip(@current_lesson.order.to_i + 1)[0].id)
    self.save

    self.update(next_available_lesson: Lesson.asc(:order).skip(@current_lesson.order.to_i + 1)[0].id)
  end

  private

    def increment_hearts n
      self.total_hearts = self.total_hearts + n
      self.save
    end
end
