require 'test_helper'

class LodgingReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lodging_review = lodging_reviews(:one)
  end

  test "should get index" do
    get lodging_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_lodging_review_url
    assert_response :success
  end

  test "should create lodging_review" do
    assert_difference('LodgingReview.count') do
      post lodging_reviews_url, params: { lodging_review: {  } }
    end

    assert_redirected_to lodging_review_url(LodgingReview.last)
  end

  test "should show lodging_review" do
    get lodging_review_url(@lodging_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_lodging_review_url(@lodging_review)
    assert_response :success
  end

  test "should update lodging_review" do
    patch lodging_review_url(@lodging_review), params: { lodging_review: {  } }
    assert_redirected_to lodging_review_url(@lodging_review)
  end

  test "should destroy lodging_review" do
    assert_difference('LodgingReview.count', -1) do
      delete lodging_review_url(@lodging_review)
    end

    assert_redirected_to lodging_reviews_url
  end
end
