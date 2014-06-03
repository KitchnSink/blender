module LessonHelper

  def lesson_is_available lesson_id, user = current_user
    key = lesson_id.to_s
    (user.status.next_available_lesson == key) || (user.gamedata.key? key)
  end

end
