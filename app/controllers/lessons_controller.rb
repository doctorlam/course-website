class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    commontator_thread_show(@lesson)

  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    3.times { @lesson.objectives.build }
    3.times { @lesson.readings.build }
    3.times { @lesson.homeworks.build }
    3.times { @lesson.classactivitys.build }

  end

  # GET /lessons/1/edit
  def edit
    @lesson.objectives.build
    @lesson.readings.build
    @lesson.homeworks.build
    @lesson.classactivitys.build
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user_id = current_user.id

    respond_to do |format|
      if @lesson.save
         if params[:attachments]
        #===== The magic is here ;)
        params[:attachments].each { |attachment|
          @lesson.attachments.create(attachment: file)
        }
      end
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
      

    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
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
      params.require(:lesson).permit(:thread, :course_id, :name, :week, :date, :image, :document, :attachment,
      objectives_attributes: [:id, :content, :_destroy],  readings_attributes: [:id, :content, :_destroy],  homeworks_attributes: [:id, :content, :_destroy],
      classactivitys_attributes: [:id, :content, :_destroy])

    end
    def check_user
      if current_user != @lesson.user
        redirect_to root_url, alert: "You don't have permission to do that!"
      end 
    end
end
