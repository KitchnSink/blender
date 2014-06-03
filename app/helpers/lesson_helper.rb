module LessonHelper

  def lesson_is_available lesson_id, user = current_user
    user.player.gamedata.key? lesson_id || user.status.next_available_lesson == lesson_id
  end

end
