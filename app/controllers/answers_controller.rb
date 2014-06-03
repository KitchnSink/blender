class AnswersController < ApplicationController
  before_action :set_answer, only: [:destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  def destroy
    authorize @answer
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to edit_lesson_path(@lesson) }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @lesson = Lesson.find(params[:lesson_id])
      @section = @lesson.sections.find(params[:section_id])
      @question = @section.questions.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:lesson).permit(:body)
    end
end
