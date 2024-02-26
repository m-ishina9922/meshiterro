require "test_helper"

class PastImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get past_images_new_url
    assert_response :success
  end

  test "should get index" do
    get past_images_index_url
    assert_response :success
  end

  test "should get show" do
    get past_images_show_url
    assert_response :success
  end
end
