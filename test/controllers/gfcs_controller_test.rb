require "test_helper"

class GfcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gfc = gfcs(:one)
  end

  test "should get index" do
    get gfcs_url
    assert_response :success
  end

  test "should get new" do
    get new_gfc_url
    assert_response :success
  end

  test "should create gfc" do
    assert_difference("Gfc.count") do
      post gfcs_url, params: { gfc: { body: @gfc.body, title: @gfc.title } }
    end

    assert_redirected_to gfc_url(Gfc.last)
  end

  test "should show gfc" do
    get gfc_url(@gfc)
    assert_response :success
  end

  test "should get edit" do
    get edit_gfc_url(@gfc)
    assert_response :success
  end

  test "should update gfc" do
    patch gfc_url(@gfc), params: { gfc: { body: @gfc.body, title: @gfc.title } }
    assert_redirected_to gfc_url(@gfc)
  end

  test "should destroy gfc" do
    assert_difference("Gfc.count", -1) do
      delete gfc_url(@gfc)
    end

    assert_redirected_to gfcs_url
  end
end
