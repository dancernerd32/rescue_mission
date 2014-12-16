require 'rails_helper'

feature "User views a question's details" do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question
  #
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  it "displays question details when question is clicked" do

    question = Question.create(title: "Are capybaras cuter with other animals or alone?",
    description: "I am a person who wants to know about cute animals
    and I want to know whether people think capybaras are cuter when interacting with
    other animals than they are on their own.")
    visit "/questions"

    click_on "Are capybaras cuter with other animals or alone?"

    expect(page).to have_content "Are capybaras cuter with other animals or alone?", "I am a person who wants to know about cute animals
    and I want to know whether people think capybaras are cuter when interacting with
    other animals than they are on their own."
  end
end
