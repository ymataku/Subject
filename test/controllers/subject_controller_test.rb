require "test_helper"

class SubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subject_index_url
    assert_response :success
  end

  test "should get show" do
    get subject_show_url
    assert_response :success
  end
end
