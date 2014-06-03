class AnswerPolicy < LessonPolicy
  def permitted_attributes
    if user.admin?
      [:body]
    else
      []
    end
  end
end
