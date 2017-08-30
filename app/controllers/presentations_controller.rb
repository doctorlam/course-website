class PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :edit, :update, :destroy]
   before_filter :check_user, only: [:edit, :update, :destroy]
  before_filter :authorize_admin, only: [:new, :create, :destroy, :edit]

  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.includes(:lessons).order('lessons.week ASC')

  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    @note = Note.new
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to @presentation, notice: 'Presentation was successfully created.' }
        format.json { render :show, status: :created, location: @presentation }
      else
        format.html { render :new }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to @presentation, notice: 'Presentation was successfully updated.' }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to presentations_url, notice: 'Presentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.require(:presentation).permit(:name, :file, {lesson_ids: []}, :lesson, :lesson_id)
    end
    def check_user
      if current_user == authorize_admin
        redirect_to root_url, alert: "You don't have permission to do that!"
      end 
    end
end
