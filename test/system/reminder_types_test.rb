require "application_system_test_case"

class ReminderTypesTest < ApplicationSystemTestCase
  setup do
    @reminder_type = reminder_types(:one)
  end

  test "visiting the index" do
    visit reminder_types_url
    assert_selector "h1", text: "Reminder Types"
  end

  test "creating a Reminder type" do
    visit reminder_types_url
    click_on "New Reminder Type"

    fill_in "Name", with: @reminder_type.name
    click_on "Create Reminder type"

    assert_text "Reminder type was successfully created"
    click_on "Back"
  end

  test "updating a Reminder type" do
    visit reminder_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @reminder_type.name
    click_on "Update Reminder type"

    assert_text "Reminder type was successfully updated"
    click_on "Back"
  end

  test "destroying a Reminder type" do
    visit reminder_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reminder type was successfully destroyed"
  end
end
