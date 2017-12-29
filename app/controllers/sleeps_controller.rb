class SleepsController < ApplicationController
  before_action :set_sleep, only: [:show, :edit, :update, :destroy]

  # GET /sleeps
  # GET /sleeps.json
  def index
    @user = User.find(params[:user_id])
    @sleeps =  @user.sleeps.all
  end

  # GET /sleeps/1
  # GET /sleeps/1.json
  def show
    @user = User.find(params[:user_id])
    # @sleep = Sleep.find(sleep_params[:id])
  end

  # GET /sleeps/new
  def new
    @user = User.find(params[:user_id])
    @sleep = @user.sleeps.new
  end

  # GET /sleeps/1/edit
  def edit
    @user = User.find(params[:user_id])
    @sleep = @user.sleeps.find(params[:id])
  end

  # POST /sleeps
  # POST /sleeps.json
  def create
      @user = User.find(params[:user_id])
    @sleep = @user.sleeps.create!(sleep_params)

    respond_to do |format|
      if @sleep.save
        format.html { redirect_to user_sleeps_path, notice: 'Sleep was successfully created.' }
        format.json { render :show, status: :created, location: @sleep }
      else
        format.html { render :new }
        format.json { render json: @sleep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sleeps/1
  # PATCH/PUT /sleeps/1.json
  def update
    @user = User.find(params[:user_id])
    @sleep = @user.sleeps.find(sleep_params[:id])
    respond_to do |format|
      if @sleep.update(sleep_params)
        format.html { redirect_to user_sleeps_path, notice: 'Sleep was successfully updated.' }
        format.json { render :show, status: :ok, location: @sleep }
      else
        format.html { render :edit }
        format.json { render json: @sleep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sleeps/1
  # DELETE /sleeps/1.json
  def destroy
    # @user = User.find(params[:user_id])
    # @sleep = @user.sleeps.find(sleep_params[:id])
    @sleep.destroy
    respond_to do |format|
      format.html { redirect_to user_sleeps_path, notice: 'Sleep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sleep
        @user = User.find(params[:user_id])
        @sleep = @user.sleeps.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def sleep_params
    #   params.fetch(:sleep, {})
    # end
    def sleep_params
      params.require(:sleep).permit(:id, :date, :goalMet, :sleepGoal, :sleepPoint)
    end

    # def log_params
    #   params.require(:log).permit(:id, :water, :sleep , :workout, :food, :goal)
    # end
end
