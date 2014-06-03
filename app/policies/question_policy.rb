class QuestionPolicy < LessonPolicy
  def permitted_attributes
    if user.admin?
      [:body, :correct_answer, :experience, answers_attributes: Pundit.policy(user, Answer).permitted_attributes]
    else
      []
    end
  end
end
