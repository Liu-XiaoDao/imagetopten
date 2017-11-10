require 'test_helper'

class UploadimageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get uploadimage_index_url
    assert_response :success
  end

  test "should get upima" do
    get uploadimage_upima_url
    assert_response :success
  end

end
