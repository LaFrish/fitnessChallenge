class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # GET /workouts
  # GET /workouts.json
  def index
    @user = User.find(params[:user_id])
    @workouts = @user.workouts.all

  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    @user = User.find(params[:user_id])
    @workout = @user.workouts.find(params[:id])
  end

  # GET /workouts/new
  def new
        @user = User.find(params[:user_id])
        @workout = @user.workouts.new
  end

  # GET /workouts/1/edit
  def edit
    @user = User.find(params[:user_id])
    @workout = @user.workouts.find(params[:id])
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @user = User.find(params[:user_id])
    @workout = @user.workouts.new

    respond_to do |format|
      if @workout.save
        format.html { redirect_to user_workouts_path, notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    # @user = User.find(params[:user_id])
    # @workout = @user.workouts.find(workout_params[:id])
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to user_workouts_path, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    # @user = User.find(params[:user_id])
    # @workout = @user.workouts.find(workout_params[:id])
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to user_workouts_path, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @user = User.find(params[:user_id])
      @workout = @user.workouts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def workout_params
    #   params.fetch(:workout, {})
    # end



    def workout_params
      params.require(:workout).permit(:id, :date, :hours, :workoutGoal, :point, :goalMet, :workoutPoint, :workoutType, :caloriesBurned, :workedoutTime, :created_at, :updated_at, :user_id)
    end
end
