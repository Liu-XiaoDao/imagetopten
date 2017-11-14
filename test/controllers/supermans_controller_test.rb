require 'test_helper'

class SupermansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supermans_index_url
    assert_response :success
  end

  test "should get edit" do
    get supermans_edit_url
    assert_response :success
  end

  test "should get show" do
    get supermans_show_url
    assert_response :success
  end

end
