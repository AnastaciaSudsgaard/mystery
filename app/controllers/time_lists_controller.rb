class TimeListsController < ApplicationController
  before_action :set_time_list, only: %i[ show edit update destroy ]

  # GET /time_lists or /time_lists.json
  def index
    @time_lists = TimeList.all
  end

  # GET /time_lists/1 or /time_lists/1.json
  def show
    @time_item = TimeItem.new
  end

  # GET /time_lists/new
  def new
    @time_list = TimeList.new
  end

  # GET /time_lists/1/edit
  def edit
  end

  # POST /time_lists or /time_lists.json
  def create
    @time_list = TimeList.new(time_list_params)

    respond_to do |format|
      if @time_list.save
        format.html { redirect_to time_list_url(@time_list), notice: "Time list was successfully created." }
        format.json { render :show, status: :created, location: @time_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_lists/1 or /time_lists/1.json
  def update
    respond_to do |format|
      if @time_list.update(time_list_params)
        format.html { redirect_to time_list_url(@time_list), notice: "Time list was successfully updated." }
        format.json { render :show, status: :ok, location: @time_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_lists/1 or /time_lists/1.json
  def destroy
    @time_list.destroy

    respond_to do |format|
      format.html { redirect_to time_lists_url, notice: "Time list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_list
      @time_list = TimeList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_list_params
      params.require(:time_list).permit(:title)
    end
end
