class QuestionsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, only: [:destroy]
  before_action :set_lesson, only: [:destroy, :answer]
  before_action :set_section, only: [:destroy]
  before_action :set_section_from_index, only: [:answer]
  before_action :set_question, only: [:destroy, :answer]
  before_action :set_answer, only: [:answer]

  def destroy
    authorize @question
    @question.destroy
    respond_to do |format|
      format.html { redirect_to edit_lesson_path(@lesson) }
      format.json { head :no_content }
      format.js {}
    end
  end

  def answer
    # check if the submitted answer matches the correct one
    if @question.correct_answer == @answer
      # if it does, reward the user all points
      exp = Experience.new(player: current_user.player, total: @question.experience, earned: @question.experience, experienceable: @question)
      exp.upsert
      # tell them about that
      flash[:success] = "Correct answer!"
    else
      # if it doesn't, reward the user no earned experience points
      exp = Experience.new(player: current_user.player, total: @question.experience, earned: 0, experienceable: @question)
      exp.upsert
      # take a heart from the user
      current_user.status.decrease_hearts
      # tell them about that
      flash[:alert] = "Oops, that was an incorrect answer, that's going to cost you 1 heart."
    end
    current_user.update_gamedata @lesson
    # redirect back to the next section or summary
    if @lesson.sections.count >= @section_index + 1
      redirect_to section_lesson_path @lesson, @section_index + 1
    else
      # if the user passed, queue up the next lesson
      if @lesson.player_grade(current_user.player) > 50
        current_user.status.update_next_lesson
        current_user.status.increase_hearts if @lesson.player_grade(current_user.player) == 100
      end

      redirect_to summary_lesson_path @lesson
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:lesson_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = @lesson.sections.find(params[:section_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_section_from_index
      @section_index = params[:section_index].to_i + 1
      @section = @lesson.sections.skip(@section_index - 1)[0]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = @section.questions.find(params[:question_id])
    end

    def set_answer
      @answer = answer_params[:answers].to_i
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:question).permit(
        :answers
      )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(*policy(@question || Question).permitted_attributes)
    end
end
