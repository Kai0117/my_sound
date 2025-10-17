require "test_helper"

class SoundInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sound_info_new_url
    assert_response :success
  end

  test "should get show" do
    get sound_info_show_url
    assert_response :success
  end
end
