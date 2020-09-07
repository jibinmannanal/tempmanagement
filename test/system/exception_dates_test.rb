require "application_system_test_case"

class ExceptionDatesTest < ApplicationSystemTestCase
  setup do
    @exception_date = exception_dates(:one)
  end

  test "visiting the index" do
    visit exception_dates_url
    assert_selector "h1", text: "Exception Dates"
  end

  test "creating a Exception date" do
    visit exception_dates_url
    click_on "New Exception Date"

    fill_in "Dates", with: @exception_date.dates
    fill_in "Name", with: @exception_date.name
    click_on "Create Exception date"

    assert_text "Exception date was successfully created"
    click_on "Back"
  end

  test "updating a Exception date" do
    visit exception_dates_url
    click_on "Edit", match: :first

    fill_in "Dates", with: @exception_date.dates
    fill_in "Name", with: @exception_date.name
    click_on "Update Exception date"

    assert_text "Exception date was successfully updated"
    click_on "Back"
  end

  test "destroying a Exception date" do
    visit exception_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exception date was successfully destroyed"
  end
end
