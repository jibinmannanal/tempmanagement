require "application_system_test_case"

class EventTypesTest < ApplicationSystemTestCase
  setup do
    @event_type = event_types(:one)
  end

  test "visiting the index" do
    visit event_types_url
    assert_selector "h1", text: "Event Types"
  end

  test "creating a Event type" do
    visit event_types_url
    click_on "New Event Type"

    fill_in "Exception date", with: @event_type.exception_date
    fill_in "Occurrence ", with: @event_type.occurrence_
    fill_in "Type", with: @event_type.type
    click_on "Create Event type"

    assert_text "Event type was successfully created"
    click_on "Back"
  end

  test "updating a Event type" do
    visit event_types_url
    click_on "Edit", match: :first

    fill_in "Exception date", with: @event_type.exception_date
    fill_in "Occurrence ", with: @event_type.occurrence_
    fill_in "Type", with: @event_type.type
    click_on "Update Event type"

    assert_text "Event type was successfully updated"
    click_on "Back"
  end

  test "destroying a Event type" do
    visit event_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event type was successfully destroyed"
  end
end
