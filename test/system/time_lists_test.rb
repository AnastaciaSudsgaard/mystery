require "application_system_test_case"

class TimeListsTest < ApplicationSystemTestCase
  setup do
    @time_list = time_lists(:one)
  end

  test "visiting the index" do
    visit time_lists_url
    assert_selector "h1", text: "Time Lists"
  end

  test "creating a Time list" do
    visit time_lists_url
    click_on "New Time List"

    fill_in "Title", with: @time_list.title
    click_on "Create Time list"

    assert_text "Time list was successfully created"
    click_on "Back"
  end

  test "updating a Time list" do
    visit time_lists_url
    click_on "Edit", match: :first

    fill_in "Title", with: @time_list.title
    click_on "Update Time list"

    assert_text "Time list was successfully updated"
    click_on "Back"
  end

  test "destroying a Time list" do
    visit time_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time list was successfully destroyed"
  end
end
