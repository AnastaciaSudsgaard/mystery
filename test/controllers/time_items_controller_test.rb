require 'test_helper'

class TimeItemsControllerTest < ActionController::TestCase
  setup do
    @time_list = time_lists(:one)
    @time_item = time_items(:one)
  end

  test "should get index" do
    get :index, params: { time_list_id: @time_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { time_list_id: @time_list }
    assert_response :success
  end

  test "should create time_item" do
    assert_difference('TimeItem.count') do
      post :create, params: { time_list_id: @time_list, time_item: @time_item.attributes }
    end

    assert_redirected_to time_list_time_item_path(@time_list, TimeItem.last)
  end

  test "should show time_item" do
    get :show, params: { time_list_id: @time_list, id: @time_item }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { time_list_id: @time_list, id: @time_item }
    assert_response :success
  end

  test "should update time_item" do
    put :update, params: { time_list_id: @time_list, id: @time_item, time_item: @time_item.attributes }
    assert_redirected_to time_list_time_item_path(@time_list, TimeItem.last)
  end

  test "should destroy time_item" do
    assert_difference('TimeItem.count', -1) do
      delete :destroy, params: { time_list_id: @time_list, id: @time_item }
    end

    assert_redirected_to time_list_time_items_path(@time_list)
  end
end
