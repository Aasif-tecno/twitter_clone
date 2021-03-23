class TweeetsController < ApplicationController
  before_action :set_tweeet, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show]

  # GET /tweeets or /tweeets.json
  def index
      @tweeets = current_user.tweeets.all.order(created_at: :desc)
      @tweeet = Tweeet.new
    @user = User.order(created_at: :desc).last(10)
  end

  # GET /tweeets/1 or /tweeets/1.json
  def show
    @comment = @tweeet.comments.build
  end

  # GET /tweeets/new
  def new
    @tweeet = current_user.tweeets.build
  end

  # GET /tweeets/1/edit
  def edit
  end

  # POST /tweeets or /tweeets.json
  def create
    @tweeet = current_user.tweeets.build(tweeet_params)

    respond_to do |format|
      if @tweeet.save
        format.html { redirect_to tweeets_url }
        format.json { render :show, status: :created, location: @tweeet }
      else
        format.html { redirect_to tweeets_url  status: :unprocessable_entity }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweeets/1 or /tweeets/1.json
  def update
    respond_to do |format|
      if @tweeet.update(tweeet_params)
        format.html { redirect_to tweeets_url notice: "Tweeet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweeet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweeets/1 or /tweeets/1.json
  def destroy
    @tweeet.destroy
    respond_to do |format|
      format.html { redirect_to tweeets_url, notice: "Tweeet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweeet
      @tweeet = Tweeet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweeet_params
      params.require(:tweeet).permit(:tweeet, :tweeet_image)
    end
end
