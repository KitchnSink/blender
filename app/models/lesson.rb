class Lesson
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
  field :order, type: String, default: 1

  has_many :sections
  has_many :experiences, as: :experienceable

  def experience
    self.sections.inject do |section, section|
      sum + section.experience
    end
  end

end
