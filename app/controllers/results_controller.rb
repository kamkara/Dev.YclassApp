class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[ show edit update destroy ]

  
  # GET /results/new
  def new
    @result = Exercise.friendly.find(params[:exercise_id]).build_result()
  end
  
  # POST /results or /results.json
  def create
    @result = Result.new(result_params)
    
    respond_to do |format|
      if @result.save
        format.html { redirect_to result_url(@result), notice: "Result was successfully created." }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
      def create
        @result = Result.new(result_params.merge({user: current_user}))
        redirect_to course_path(@result.exercice.course) and return if @result.save
        render :new
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:grade, :user_id, :exercise_id, answer: {})
    end
end
