require 'test_helper'

class TodoInsidesControllerTest < ActionController::TestCase
  setup do
    @todo_list = todo_lists(:one)
    @todo_inside = todo_insides(:one)
  end

  test "should get index" do
    get :index, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should create todo_inside" do
    assert_difference('TodoInside.count') do
      post :create, params: { todo_list_id: @todo_list, todo_inside: @todo_inside.attributes }
    end

    assert_redirected_to todo_list_todo_inside_path(@todo_list, TodoInside.last)
  end

  test "should show todo_inside" do
    get :show, params: { todo_list_id: @todo_list, id: @todo_inside }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { todo_list_id: @todo_list, id: @todo_inside }
    assert_response :success
  end

  test "should update todo_inside" do
    put :update, params: { todo_list_id: @todo_list, id: @todo_inside, todo_inside: @todo_inside.attributes }
    assert_redirected_to todo_list_todo_inside_path(@todo_list, TodoInside.last)
  end

  test "should destroy todo_inside" do
    assert_difference('TodoInside.count', -1) do
      delete :destroy, params: { todo_list_id: @todo_list, id: @todo_inside }
    end

    assert_redirected_to todo_list_todo_insides_path(@todo_list)
  end
end
