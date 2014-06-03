class SectionsController < ApplicationController
  before_action :set_section, only: [:destroy]
  before_action :authenticate_user!

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to edit_lesson_path(@lesson) }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @lesson = Lesson.find(params[:lesson_id])
      @section = @lesson.sections.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:lesson).permit(:body, :metadata, questions_attributes: [:body, :correct_answer, :experience, answers_attributes: [:body]])
    end
end
