class TodoInsidesController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_inside, only: [:show, :edit, :update, :destroy]

  # GET todo_lists/1/todo_insides
  def index
    @todo_insides = @todo_list.todo_insides
  end

  # GET todo_lists/1/todo_insides/1
  def show
  end

  # GET todo_lists/1/todo_insides/new
  def new
    @todo_inside = @todo_list.todo_insides.build
  end

  # GET todo_lists/1/todo_insides/1/edit
  def edit
  end

  # POST todo_lists/1/todo_insides
  def create
    @todo_inside = @todo_list.todo_insides.build(todo_inside_params)
    @todo_inside.login_user_id = current_login_user.id


    if @todo_inside.save
      redirect_to(@todo_inside.todo_list)
    else
      render action: 'new'
    end
  end

  # PUT todo_lists/1/todo_insides/1
  def update
    if @todo_inside.update_attributes(todo_inside_params)
      redirect_to([@todo_inside.todo_list, @todo_inside], notice: 'Todo inside was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE todo_lists/1/todo_insides/1
  def destroy
    @todo_inside.destroy

    redirect_to todo_list_todo_insides_url(@todo_list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_todo_inside
      @todo_inside = @todo_list.todo_insides.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_inside_params
      params.require(:todo_inside).permit(:description, :completed, :completed_at, :todo_list_id, :login_user_id, :book_id)
    end
end
