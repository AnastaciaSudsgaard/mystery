require 'test_helper'

class TodoContentsControllerTest < ActionController::TestCase
  setup do
    @todo_list = todo_lists(:one)
    @todo_content = todo_contents(:one)
  end

  test "should get index" do
    get :index, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should create todo_content" do
    assert_difference('TodoContent.count') do
      post :create, params: { todo_list_id: @todo_list, todo_content: @todo_content.attributes }
    end

    assert_redirected_to todo_list_todo_content_path(@todo_list, TodoContent.last)
  end

  test "should show todo_content" do
    get :show, params: { todo_list_id: @todo_list, id: @todo_content }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { todo_list_id: @todo_list, id: @todo_content }
    assert_response :success
  end

  test "should update todo_content" do
    put :update, params: { todo_list_id: @todo_list, id: @todo_content, todo_content: @todo_content.attributes }
    assert_redirected_to todo_list_todo_content_path(@todo_list, TodoContent.last)
  end

  test "should destroy todo_content" do
    assert_difference('TodoContent.count', -1) do
      delete :destroy, params: { todo_list_id: @todo_list, id: @todo_content }
    end

    assert_redirected_to todo_list_todo_contents_path(@todo_list)
  end
end
