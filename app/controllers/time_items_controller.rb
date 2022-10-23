class TimeItemsController < ApplicationController
  before_action :set_time_list
  before_action :set_time_item, only: [:show, :edit, :update, :destroy]

  # GET time_lists/1/time_items
  def index
    @time_items = @time_list.time_items
  end

  # GET time_lists/1/time_items/1
  def show
  end

  # GET time_lists/1/time_items/new
  def new
    @time_item = @time_list.time_items.build
  end

  # GET time_lists/1/time_items/1/edit
  def edit
  end

  # POST time_lists/1/time_items
  def create
    @time_item = @time_list.time_items.build(time_item_params)

    if @time_item.save
      redirect_to(@time_item.time_list)
    else
      render action: 'new'
    end
  end

  # PUT time_lists/1/time_items/1
  def update
    if @time_item.update_attributes(time_item_params)
      redirect_to([@time_item.time_list, @time_item], notice: 'Time item was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE time_lists/1/time_items/1
  def destroy
    @time_item.destroy

    redirect_to time_list_time_items_url(@time_list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_list
      @time_list = TimeList.find(params[:time_list_id])
    end

    def set_time_item
      @time_item = @time_list.time_items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def time_item_params
      params.require(:time_item).permit(:description, :completed, :completed_at, :time_list_id)
    end
end
