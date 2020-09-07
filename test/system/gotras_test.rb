require "application_system_test_case"

class GotrasTest < ApplicationSystemTestCase
  setup do
    @gotra = gotras(:one)
  end

  test "visiting the index" do
    visit gotras_url
    assert_selector "h1", text: "Gotras"
  end

  test "creating a Gotra" do
    visit gotras_url
    click_on "New Gotra"

    fill_in "Name", with: @gotra.name
    click_on "Create Gotra"

    assert_text "Gotra was successfully created"
    click_on "Back"
  end

  test "updating a Gotra" do
    visit gotras_url
    click_on "Edit", match: :first

    fill_in "Name", with: @gotra.name
    click_on "Update Gotra"

    assert_text "Gotra was successfully updated"
    click_on "Back"
  end

  test "destroying a Gotra" do
    visit gotras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gotra was successfully destroyed"
  end
end
