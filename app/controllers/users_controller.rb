class UsersController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show]

  def index
    @user = current_user
    @users = User.all
    @logs =@user.logs.all
    @waters = @user.waters.all
    @sleeps =  @user.sleeps.all
    @foods =  @user.foods.all
    @workouts =  @user.workouts.all

  end

  def new
    @user = User.new
  end

  def create
    # @user = current_user
    @user = User.create!(user_params)
    # if @user.save
    #   redirect_to root_url, :notice => "Signed up!"
    # else
    #   render "new"
    # end
  end

  def show

    @user = User.find(params[:id])
    # @user = User.find(params[:id])
    #   respond_to do |format|
    #       format.html
    #       format.json{
    #         render json: {users: render_to_string(partial: ["user"], formats: :html, collection: [@users])}
    #       }
    #   end
    end

  # end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    @user = update(user_params)

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(
    :firstName, :LastName, :startWeight, :goalWeight, :id, :email, :password, :password_confirmation, :username, :created_at, :updated_at)

  end
  def log_params
    params.require(:log).permit(:id, :water, :sleep, :workout, :food)
  end
  # def log_params
  #   params.require(:log).permit(:id, :date, :weeklyLog, :dailyLog, :caloricIntake, :waterIntake, :slept, :workout, :weeklygoal, :weeklyweight, :weightlost, :weightgain, :bonusPoints, :totalPoints, :weeklyPoints, :created_at, :updated_at, :user_id)
  # end
end
