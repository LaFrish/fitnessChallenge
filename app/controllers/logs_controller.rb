class LogsController < ApplicationController
  # before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @user = User.find(params[:user_id])
    @logs =@user.logs.all

    # @waters = @user.logs.waters
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    @user = User.find(params[:user_id])
    @log = @user.logs.find(log_params[:id])
  end

  # GET /logs/new
  def new
    @user = User.find(params[:user_id])
    @log = @user.logs.new
  end


  # POST /logs
  # POST /logs.json
  def create
    @user = User.find(params[:user_id])
    # @log =  @user.logs.create!(log_params)
    @log =  @user.logs.create!

    respond_to do |format|
      if @log.save
        format.html { redirect_to user_logs_url, notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /logs/1/edit
  def edit
    @user = User.find(params[:user_id])
    @log = @user.logs.find(params[:id])
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    @user = User.find(params[:user_id])
    @log = @user.logs.find(params[:id])
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to user_logs_url, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @user = User.find(params[:user_id])
    @log = @user.logs.find(params[:id])
    @log.destroy
    respond_to do |format|
      format.html { redirect_to user_logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_log
    #   @user = User.find(params[:user_id])
    #   @log = @user.logs.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def log_params
    #   params.require(:log).permit(:water, :sleep , :workout, :food, :goal)
    # end
    def log_params
      params.require(:log).permit(:id, :date, :water, :sleep , :workout, :food, :goal, :point, :totalPoints, :weightStatus, :weeklyGoalMet, :created_at , :updated_at,  :user_id, :goal_id)
    end

    def user_params
      params.require(:user).permit(:id,
      :firstName, :LastName, :startWeight, :goalWeight, :email, :password, :password_confirmation, :username, :created_at, :updated_at)
    end

    def food_params
      params.require(:food).permit(:id, :date, :goalMet, :foodPoint , :foodGoal, :created_at , :updated_at,  :user_id)
    end

    def sleep_params
      params.require(:sleep).permit(:id, :date, :goalMet, :sleepGoal, :sleepPoint)
    end

    def water_params
      params.require(:water).permit(:id, :date, :waterDrank, :waterGoal, :point, :goalMet, :waterPoint, :created_at, :updated_at, :user_id)
    end

    def water_params
      params.require(:workout).permit(:id, :date, :hours, :workoutGoal, :point, :goalMet, :workoutPoint, :workoutType, :caloriesBurned, :workedoutTime, :created_at, :updated_at, :user_id)
    end

    def goal_params
      params.require(:goals).permit(:id, :created_at, :updated_at, :user_id, :waterGoal, :waterPoint, :weightGoal, :weightPoint, :sleepPoint, :sleepGoal, :workoutGoal, :workoutPoint, :foodPoint, :foodGoal)
    end

end
