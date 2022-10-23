require "test_helper"

class TimeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_list = time_lists(:one)
  end

  test "should get index" do
    get time_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_time_list_url
    assert_response :success
  end

  test "should create time_list" do
    assert_difference('TimeList.count') do
      post time_lists_url, params: { time_list: { title: @time_list.title } }
    end

    assert_redirected_to time_list_url(TimeList.last)
  end

  test "should show time_list" do
    get time_list_url(@time_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_list_url(@time_list)
    assert_response :success
  end

  test "should update time_list" do
    patch time_list_url(@time_list), params: { time_list: { title: @time_list.title } }
    assert_redirected_to time_list_url(@time_list)
  end

  test "should destroy time_list" do
    assert_difference('TimeList.count', -1) do
      delete time_list_url(@time_list)
    end

    assert_redirected_to time_lists_url
  end
end
