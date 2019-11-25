require "application_system_test_case"

class BogglesTest < ApplicationSystemTestCase
  setup do
    @boggle = boggles(:one)
  end

  test "visiting the index" do
    visit boggles_url
    assert_selector "h1", text: "Boggles"
  end

  test "creating a Boggle" do
    visit boggles_url
    click_on "New Boggle"

    fill_in "Board", with: @boggle.board
    fill_in "Col", with: @boggle.col
    fill_in "Name", with: @boggle.name
    fill_in "Row", with: @boggle.row
    click_on "Create Boggle"

    assert_text "Boggle was successfully created"
    click_on "Back"
  end

  test "updating a Boggle" do
    visit boggles_url
    click_on "Edit", match: :first

    fill_in "Board", with: @boggle.board
    fill_in "Col", with: @boggle.col
    fill_in "Name", with: @boggle.name
    fill_in "Row", with: @boggle.row
    click_on "Update Boggle"

    assert_text "Boggle was successfully updated"
    click_on "Back"
  end

  test "destroying a Boggle" do
    visit boggles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Boggle was successfully destroyed"
  end
end
