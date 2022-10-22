require 'test_helper'

class TodoInsControllerTest < ActionController::TestCase
  setup do
    @todo_list = todo_lists(:one)
    @todo_in = todo_ins(:one)
  end

  test "should get index" do
    get :index, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should create todo_in" do
    assert_difference('TodoIn.count') do
      post :create, params: { todo_list_id: @todo_list, todo_in: @todo_in.attributes }
    end

    assert_redirected_to todo_list_todo_in_path(@todo_list, TodoIn.last)
  end

  test "should show todo_in" do
    get :show, params: { todo_list_id: @todo_list, id: @todo_in }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { todo_list_id: @todo_list, id: @todo_in }
    assert_response :success
  end

  test "should update todo_in" do
    put :update, params: { todo_list_id: @todo_list, id: @todo_in, todo_in: @todo_in.attributes }
    assert_redirected_to todo_list_todo_in_path(@todo_list, TodoIn.last)
  end

  test "should destroy todo_in" do
    assert_difference('TodoIn.count', -1) do
      delete :destroy, params: { todo_list_id: @todo_list, id: @todo_in }
    end

    assert_redirected_to todo_list_todo_ins_path(@todo_list)
  end
end
