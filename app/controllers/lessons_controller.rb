class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_section, only: [:show]
  before_action :find_question, only: [:show]

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def show
  end

  def summary
  end

  def edit
  end

  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'lesson was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lesson }
      else
        format.html { render action: 'new' }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    puts @lesson
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      # params.require(:test_set).permit(:name, tags_attributes: [:id, :name])
      params.require(:lesson).permit(
        :title, :body, :order,
        sections_attributes: [
          :id, :body, :metadata, :_destroy, :lesson_id,
          questions_attributes: [
            :body, :correct_answer, :experience,
            answers_attributes: [:body]
          ]
        ]
      )
      # params.require(:lesson).permit(*policy(@lesson || Lesson).permitted_attributes)
    end

    def find_section
      redirect_to section_lesson_path @lesson, 1 unless(params[:section])

      @section_index = params[:section].to_i ? params[:section].to_i - 1 : 0

      @section = @lesson.sections.skip(@section_index)[0]

      if @section.nil?
        redirect_to section_lesson_path @lesson, 1
      end
    end

    def find_question
      @question = @section.questions.first
    end
end
