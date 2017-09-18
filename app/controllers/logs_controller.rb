class LogsController < ApplicationController
  before_filter :get_user
  # before_filter :get_log

  def index
    @users = User.find(params[:user_id])
    # @logs = Log.all
    @logs = @user.logs


  end

  def new
    @user = User.find(params[:user_id])
    @log = Log.new

  end

  def create
    @user = User.find(params[:user_id])
    @log = @user.logs.create!(log_params[:id])
    # @log = @user.logs.create!(params[:log].permit(:date, :weeklyLog, :dailyLog, :caloricIntake, :waterIntake, :slept, :workout, :weeklygoal, :weeklyweight, :weightlost, :weightgain, :bonusPoints, :totalPoints, :weeklyPoints, :created_at, :updated_at, :user_id))

    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
    @log = @user.logs.find(params[:id])
  end


  def edit
    @user = User.find(params[:user_id])
    @log = Log.find(params[:id])
    # @log = Us.log.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    # @log = Log.find(params[:id])
    @log = @user.logs.update(params[:log].permit(:date, :weeklyLog, :dailyLog, :caloricIntake, :waterIntake, :slept, :workout, :weeklygoal, :weeklyweight, :weightlost, :weightgain, :bonusPoints, :totalPoints, :weeklyPoints, :created_at, :updated_at, :user_id))

    redirect_to user_log_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @log = Log.find(params[:id])
    @log.destroy

    redirect_to user_logs_path(@user)
  end

  private
  def log_params
    params.require(:log).permit(:id, :date, :weeklyLog, :dailyLog, :caloricIntake, :waterIntake, :slept, :workout, :weeklygoal, :weeklyweight, :weightlost, :weightgain, :bonusPoints, :totalPoints, :weeklyPoints, :created_at, :updated_at, :user_id)
  end
  def user_params
    params.require(:user).permit(
    :firstName, :LastName, :startWeight, :goalWeight, :id)
  end

  def get_user
  @user = User.find(params[:user_id])
end
end
