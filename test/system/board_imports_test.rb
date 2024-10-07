require "application_system_test_case"

class BoardImportsTest < ApplicationSystemTestCase
  setup do
    @board_import = board_imports(:one)
  end

  test "visiting the index" do
    visit board_imports_url
    assert_selector "h1", text: "Board imports"
  end

  test "should create board import" do
    visit board_imports_url
    click_on "New board import"

    fill_in "Status", with: @board_import.status
    click_on "Create Board import"

    assert_text "Board import was successfully created"
    click_on "Back"
  end

  test "should update Board import" do
    visit board_import_url(@board_import)
    click_on "Edit this board import", match: :first

    fill_in "Status", with: @board_import.status
    click_on "Update Board import"

    assert_text "Board import was successfully updated"
    click_on "Back"
  end

  test "should destroy Board import" do
    visit board_import_url(@board_import)
    click_on "Destroy this board import", match: :first

    assert_text "Board import was successfully destroyed"
  end
end
