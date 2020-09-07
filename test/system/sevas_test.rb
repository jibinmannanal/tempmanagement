require "application_system_test_case"

class SevasTest < ApplicationSystemTestCase
  setup do
    @seva = sevas(:one)
  end

  test "visiting the index" do
    visit sevas_url
    assert_selector "h1", text: "Sevas"
  end

  test "creating a Seva" do
    visit sevas_url
    click_on "New Seva"

    fill_in "Audit logs", with: @seva.audit_logs
    fill_in "Identification number", with: @seva.identification_number
    fill_in "Instructions", with: @seva.instructions
    fill_in "Name", with: @seva.name
    fill_in "Rate", with: @seva.rate
    fill_in "Status", with: @seva.status
    click_on "Create Seva"

    assert_text "Seva was successfully created"
    click_on "Back"
  end

  test "updating a Seva" do
    visit sevas_url
    click_on "Edit", match: :first

    fill_in "Audit logs", with: @seva.audit_logs
    fill_in "Identification number", with: @seva.identification_number
    fill_in "Instructions", with: @seva.instructions
    fill_in "Name", with: @seva.name
    fill_in "Rate", with: @seva.rate
    fill_in "Status", with: @seva.status
    click_on "Update Seva"

    assert_text "Seva was successfully updated"
    click_on "Back"
  end

  test "destroying a Seva" do
    visit sevas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seva was successfully destroyed"
  end
end
