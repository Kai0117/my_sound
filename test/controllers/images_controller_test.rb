require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get proxy" do
    get images_proxy_url
    assert_response :success
  end
end
