class DashboardController < ApplicationController
  def index
    @lessons = Lesson.all
  end
end
