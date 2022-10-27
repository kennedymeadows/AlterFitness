require "application_system_test_case"

class GfcsTest < ApplicationSystemTestCase
  setup do
    @gfc = gfcs(:one)
  end

  test "visiting the index" do
    visit gfcs_url
    assert_selector "h1", text: "Gfcs"
  end

  test "should create gfc" do
    visit gfcs_url
    click_on "New gfc"

    fill_in "Body", with: @gfc.body
    fill_in "Title", with: @gfc.title
    click_on "Create Gfc"

    assert_text "Gfc was successfully created"
    click_on "Back"
  end

  test "should update Gfc" do
    visit gfc_url(@gfc)
    click_on "Edit this gfc", match: :first

    fill_in "Body", with: @gfc.body
    fill_in "Title", with: @gfc.title
    click_on "Update Gfc"

    assert_text "Gfc was successfully updated"
    click_on "Back"
  end

  test "should destroy Gfc" do
    visit gfc_url(@gfc)
    click_on "Destroy this gfc", match: :first

    assert_text "Gfc was successfully destroyed"
  end
end
