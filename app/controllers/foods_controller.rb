class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    @user = User.find(params[:user_id])
    @food = @user.foods.find(food_params[:id])
  end

  # GET /foods/new
  def new
    @user = User.find(params[:user_id])
    @food = @user.foods.new
  end

  # GET /foods/1/edit
  def edit
    @user = User.find(params[:user_id])
    @food = @user.foods.find(food_params[:id])
  end

  # POST /foods
  # POST /foods.json
  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.create!(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to user_foods_path, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    @user = User.find(params[:user_id])
    @food = @user.foods.find(food_params[:id])
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to user_foods_path, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @user = User.find(params[:user_id])
    @food = @user.foods.find(food_params[:id])
    @food.destroy
    respond_to do |format|
      format.html { redirect_to user_foods_path, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @user = User.find(params[:user_id])
      @food = @user.foods.find(food_params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def food_params
    #   params.fetch(:food, {})
    # end

    def food_params
      params.require(:food).permit(:id, :date, :goalMet, :foodPoint , :foodGoal, :created_at , :updated_at,  :user_id)
    end

    def log_params
      params.require(:log).permit(:id, :date, :water, :sleep , :workout, :food, :goal, :point, :totalPoints, :weightStatus, :weeklyGoalMet, :created_at , :updated_at,  :user_id, :goal_id)
    end
end
