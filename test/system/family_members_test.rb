require "application_system_test_case"

class FamilyMembersTest < ApplicationSystemTestCase
  setup do
    @family_member = family_members(:one)
  end

  test "visiting the index" do
    visit family_members_url
    assert_selector "h1", text: "Family Members"
  end

  test "creating a Family member" do
    visit family_members_url
    click_on "New Family Member"

    fill_in "Dob", with: @family_member.dob
    fill_in "Nakshatra", with: @family_member.nakshatra
    fill_in "Name", with: @family_member.name
    click_on "Create Family member"

    assert_text "Family member was successfully created"
    click_on "Back"
  end

  test "updating a Family member" do
    visit family_members_url
    click_on "Edit", match: :first

    fill_in "Dob", with: @family_member.dob
    fill_in "Nakshatra", with: @family_member.nakshatra
    fill_in "Name", with: @family_member.name
    click_on "Update Family member"

    assert_text "Family member was successfully updated"
    click_on "Back"
  end

  test "destroying a Family member" do
    visit family_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Family member was successfully destroyed"
  end
end
