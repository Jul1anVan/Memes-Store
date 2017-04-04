require 'test_helper'

class LineItemControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get line_item_create_url
    assert_response :success
  end

  test "should get update" do
    get line_item_update_url
    assert_response :success
  end

  test "should get destroy" do
    get line_item_destroy_url
    assert_response :success
  end

end
