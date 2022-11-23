require "application_system_test_case"

class TutorialsTest < ApplicationSystemTestCase
  setup do
    @tutorial = tutorials(:one)
  end

  test "visiting the index" do
    visit tutorials_url
    assert_selector "h1", text: "Tutorials"
  end

  test "should create tutorial" do
    visit tutorials_url
    click_on "New tutorial"

    fill_in "Author", with: @tutorial.author
    fill_in "Body", with: @tutorial.body
    fill_in "Category", with: @tutorial.category
    fill_in "Description", with: @tutorial.description
    fill_in "Downvotes", with: @tutorial.downvotes
    fill_in "Title", with: @tutorial.title
    fill_in "Upvotes", with: @tutorial.upvotes
    click_on "Create Tutorial"

    assert_text "Tutorial was successfully created"
    click_on "Back"
  end

  test "should update Tutorial" do
    visit tutorial_url(@tutorial)
    click_on "Edit this tutorial", match: :first

    fill_in "Author", with: @tutorial.author
    fill_in "Body", with: @tutorial.body
    fill_in "Category", with: @tutorial.category
    fill_in "Description", with: @tutorial.description
    fill_in "Downvotes", with: @tutorial.downvotes
    fill_in "Title", with: @tutorial.title
    fill_in "Upvotes", with: @tutorial.upvotes
    click_on "Update Tutorial"

    assert_text "Tutorial was successfully updated"
    click_on "Back"
  end

  test "should destroy Tutorial" do
    visit tutorial_url(@tutorial)
    click_on "Destroy this tutorial", match: :first

    assert_text "Tutorial was successfully destroyed"
  end
end
