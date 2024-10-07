require "test_helper"

class BoardImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_import = board_imports(:one)
  end

  test "should get index" do
    get board_imports_url
    assert_response :success
  end

  test "should get new" do
    get new_board_import_url
    assert_response :success
  end

  test "should create board_import" do
    assert_difference("BoardImport.count") do
      post board_imports_url, params: { board_import: { status: @board_import.status } }
    end

    assert_redirected_to board_import_url(BoardImport.last)
  end

  test "should show board_import" do
    get board_import_url(@board_import)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_import_url(@board_import)
    assert_response :success
  end

  test "should update board_import" do
    patch board_import_url(@board_import), params: { board_import: { status: @board_import.status } }
    assert_redirected_to board_import_url(@board_import)
  end

  test "should destroy board_import" do
    assert_difference("BoardImport.count", -1) do
      delete board_import_url(@board_import)
    end

    assert_redirected_to board_imports_url
  end
end
