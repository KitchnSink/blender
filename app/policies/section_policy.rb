class SectionPolicy < LessonPolicy
  def permitted_attributes
    if user.admin?
      [:body, :metadata, questions_attributes: Pundit.policy(user, Question).permitted_attributes]
    else
      []
    end
  end
end
