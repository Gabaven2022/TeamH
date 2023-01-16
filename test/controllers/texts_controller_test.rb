require "test_helper"

class TextsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get texts_index_url
    assert_response :success
  end

  test "should get create" do
    get texts_create_url
    assert_response :success
  end
end
