class WatersController < ApplicationController
  before_action :set_water, only: [:show, :edit, :update, :destroy]

  # GET /waters
  # GET /waters.json
  def index
    @user = User.find(params[:user_id])
    @waters = @user.waters
    # @waters = Waters.all
  end

  # GET /waters/1
  # GET /waters/1.json
  def show
    @user = User.find(params[:user_id])
    @water = @user.waters.find(params[:id])
  end

  # GET /waters/new
  def new
    @user = User.find(params[:user_id])
    @water = @user.waters.new
  end

  # GET /waters/1/edit
  def edit
    @user = User.find(params[:user_id])
    @water = @user.waters.find(water_params[:id])
  end

  # POST /waters
  # POST /waters.json
  def create
    @user = User.find(params[:user_id])
    @water = @user.waters.create!(water_params)

    respond_to do |format|
      if @water.save
        format.html { redirect_to user_waters_path, notice: 'Water was successfully created.' }
        format.json { render :show, status: :created, location: @water }
      else
        format.html { render :new }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waters/1
  # PATCH/PUT /waters/1.json
  def update
    @user = User.find(params[:user_id])
    @water = @user.waters.find(water_params[:id])
    respond_to do |format|
      if @water.update(water_params)
        format.html { redirect_to user_waters_path, notice: 'Water was successfully updated.' }
        format.json { render :show, status: :ok, location: @water }
      else
        format.html { render :edit }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waters/1
  # DELETE /waters/1.json
  def destroy
    # @user = User.find(params[:user_id])
    # @water = @user.waters.find(water_params[:id])
    @water.destroy
    respond_to do |format|
      format.html { redirect_to user_waters_path, notice: 'Water was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water

      @user = User.find(params[:user_id])
      @water = @user.waters.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def water_params
    #   params.fetch(:water, {:date, :waterDrank, :waterGoal, :point, :goalMet, :waterPoint})
    # end
    def water_params
      params.require(:water).permit(:id, :date, :waterDrank, :waterGoal, :point, :goalMet, :waterPoint, :created_at, :updated_at)
    end

    def log_params
      params.require(:log).permit(:id, :water, :sleep , :workout, :food, :goal)
    end
end
