require "application_system_test_case"

class LodgingReviewsTest < ApplicationSystemTestCase
  setup do
    @lodging_review = lodging_reviews(:one)
  end

  test "visiting the index" do
    visit lodging_reviews_url
    assert_selector "h1", text: "Lodging Reviews"
  end

  test "creating a Lodging review" do
    visit lodging_reviews_url
    click_on "New Lodging Review"

    click_on "Create Lodging review"

    assert_text "Lodging review was successfully created"
    click_on "Back"
  end

  test "updating a Lodging review" do
    visit lodging_reviews_url
    click_on "Edit", match: :first

    click_on "Update Lodging review"

    assert_text "Lodging review was successfully updated"
    click_on "Back"
  end

  test "destroying a Lodging review" do
    visit lodging_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lodging review was successfully destroyed"
  end
end
