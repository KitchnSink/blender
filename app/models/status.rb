class Status
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  after_initialize :add_next_available_lesson

  field :total_hearts, type: Integer, default: 10
  field :max_hearts, type: Integer, default: 10
  field :next_available_lesson, type: String

  embedded_in :player

  def total_experience
    @calculated_total_experience = @total_experience || calc_total_experience
  end

  def calc_total_experience
    self.experience.pluck(:earned).inject(0, :+)
  end

  private

    def add_next_available_lesson
      self.next_available_lesson = Lesson.order_by(:order.asc).first.id.to_s
    end
end
