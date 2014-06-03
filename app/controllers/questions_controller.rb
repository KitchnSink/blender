class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :destroy]
  before_action :authenticate_user!

  def show

  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to edit_lesson_path(@lesson) }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @lesson = Lesson.find(params[:lesson_id])
      @section = @lesson.sections.find(params[:section_id])
      @question = @section.questions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:lesson).permit(:body, :answers, :correct_answer)
    end
end
