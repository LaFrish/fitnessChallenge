class LogsController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    @logs = Log.all
  end

  def new
    @user = User.find(params[:user_id])
    @log = Log.new

  end

  def create
    @user = User.find(params[:user_id])
    @log = @user.log.create!(log_params)

    redirect_to user_logs_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
    @log = Log.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @log = Log.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @log = Log.find(params[:id])
    @log.update(log_params)

    redirect_to user_logs_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @log = Log.find(params[:id])
    @log.destroy

    redirect_to user_logs_path(@user)
  end

  private
  def log_params
    params.require(:log).permit(:weeklyLog, :dailyLog)
  end
end
