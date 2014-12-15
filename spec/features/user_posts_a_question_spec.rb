require 'rails_helper'

feature "User posts a new question" do
  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  it "posts a valid question" do
    # Visit the page containing the new question form
    visit '/questions/new'

    # Fill in the input field with the 'Location' label
    fill_in "Title", with: "Are capybaras cuter with other animals or alone?"
    fill_in "Description", with: "I am a person who wants to know about cute animals
    and I want to know whether people think capybaras are cuter when interacting with
    other animals than they are on their own."
    click_on "Post Question"

    expect(page).to have_content "Question was successfully posted"
  end
end
