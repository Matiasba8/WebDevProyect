require "application_system_test_case"

class LodgingsTest < ApplicationSystemTestCase
  setup do
    @lodging = lodgings(:one)
  end

  test "visiting the index" do
    visit lodgings_url
    assert_selector "h1", text: "Lodgings"
  end

  test "creating a Lodging" do
    visit lodgings_url
    click_on "New Lodging"

    click_on "Create Lodging"

    assert_text "Lodging was successfully created"
    click_on "Back"
  end

  test "updating a Lodging" do
    visit lodgings_url
    click_on "Edit", match: :first

    click_on "Update Lodging"

    assert_text "Lodging was successfully updated"
    click_on "Back"
  end

  test "destroying a Lodging" do
    visit lodgings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lodging was successfully destroyed"
  end
end
