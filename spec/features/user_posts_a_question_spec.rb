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

  scenario "posts a valid question" do
    # Visit the page containing the new question form
    visit '/questions/new'

    # Fill in the input field with the 'Location' label
    fill_in "Title", with: "Are capybaras cuter with other animals or alone?"
    fill_in "Description", with: "I am a person who wants to know about cute animals
    and I want to know whether people think capybaras are cuter when interacting with
    other animals than they are on their own."
    click_on "Post Question"

    expect(page).to have_content "Are capybaras cuter with other animals or alone?"
  end

  scenario "posts an invalid question -- doesn't provide a title" do
    visit '/questions/new'
    fill_in "Title", with: ""
    fill_in "Description", with: "I am a person who wants to know about cute animals
    and I want to know whether people think capybaras are cuter when interacting with
    other animals than they are on their own."
    click_on "Post Question"

    expect(page).to have_content "Title can't be blank"
  end

  scenario "posts an invalid question -- provides a title of insufficient length" do
    visit '/questions/new'
    fill_in "Title", with: "Are capybaras cute?"
    fill_in "Description", with: "I am a person who wants to know about cute animals
    and I want to know whether people think capybaras are cuter when interacting with
    other animals than they are on their own."
    click_on "Post Question"

    expect(page).to have_content "Title is too short (minimum is 40 characters)"
  end

  scenario "posts an invalid question -- doesn't provide a description" do
    visit '/questions/new'
    fill_in "Title", with: "Are capybaras cuter with other animals or alone?"

    click_on "Post Question"

    expect(page).to have_content "Description can't be blank"
  end

  scenario "posts an invalid question -- provides a description of insufficient length" do
    visit '/questions/new'
    fill_in "Title", with: "Are capybaras cuter with other animals or alone?"
    fill_in "Description", with: "Are capybaras cute?"
    click_on "Post Question"

    expect(page).to have_content "Description is too short (minimum is 150 characters)"
  end

end
