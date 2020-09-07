require "application_system_test_case"

class SevaTypesTest < ApplicationSystemTestCase
  setup do
    @seva_type = seva_types(:one)
  end

  test "visiting the index" do
    visit seva_types_url
    assert_selector "h1", text: "Seva Types"
  end

  test "creating a Seva type" do
    visit seva_types_url
    click_on "New Seva Type"

    fill_in "Name", with: @seva_type.name
    click_on "Create Seva type"

    assert_text "Seva type was successfully created"
    click_on "Back"
  end

  test "updating a Seva type" do
    visit seva_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @seva_type.name
    click_on "Update Seva type"

    assert_text "Seva type was successfully updated"
    click_on "Back"
  end

  test "destroying a Seva type" do
    visit seva_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seva type was successfully destroyed"
  end
end
