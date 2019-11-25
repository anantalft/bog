require 'test_helper'

class BogglesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boggle = boggles(:one)
  end

  test "should get index" do
    get boggles_url
    assert_response :success
  end

  test "should get new" do
    get new_boggle_url
    assert_response :success
  end

  test "should create boggle" do
    assert_difference('Boggle.count') do
      post boggles_url, params: { boggle: { board: @boggle.board, col: @boggle.col, name: @boggle.name, row: @boggle.row } }
    end

    assert_redirected_to boggle_url(Boggle.last)
  end

  test "should show boggle" do
    get boggle_url(@boggle)
    assert_response :success
  end

  test "should get edit" do
    get edit_boggle_url(@boggle)
    assert_response :success
  end

  test "should update boggle" do
    patch boggle_url(@boggle), params: { boggle: { board: @boggle.board, col: @boggle.col, name: @boggle.name, row: @boggle.row } }
    assert_redirected_to boggle_url(@boggle)
  end

  test "should destroy boggle" do
    assert_difference('Boggle.count', -1) do
      delete boggle_url(@boggle)
    end

    assert_redirected_to boggles_url
  end
end
