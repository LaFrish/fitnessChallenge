class GoalsController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    @goals = Goal.all
  end

  def new
    @user = User.find(params[:user_id])
    @goal = Goal.new

  end

  def create
    @user = User.find(params[:user_id])
    @goal = @user.goal.create!(goal_params)

    redirect_to user_goals_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
    @goal = Goal.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @goal = Goal.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)

    redirect_to user_goals_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to user_goals_path(@user)
  end

  private
  def goal_params
    params.require(:goal).permit(:caloricIntake, :waterIntake, :slept, :workout, :weeklygoal, :weeklyweight, :weightlost, :weightgain, :bonusPoints, :totalPoints, :weeklyPoints, :created_at,:updated_at)
    # params.require(:goal).permit(:weight, :water_intake, :daily_calories, :daily_workout)
  end
end
