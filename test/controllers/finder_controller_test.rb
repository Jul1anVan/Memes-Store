require 'test_helper'

class FinderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get finder_index_url
    assert_response :success
  end

  test "should get category" do
    get finder_category_url
    assert_response :success
  end

end
