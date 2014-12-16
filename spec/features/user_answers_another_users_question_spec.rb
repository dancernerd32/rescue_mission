require 'rails_helper'

feature "User answers another users question" do

# As a user
# I want to answer another user's question
# So that I can help them solve their problem
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectly
scenario "User provides a valid answer" do

  question = Question.create!(title: "How much wood would a woodchuck chuck if a
  woodchuck could chuck wood?", description: "Please tell me about the amount of
  wood that a woodchuck would chuck if a woodchuck could chuck wood. Would he
  chuck all the wood that he could? Would he?")

  visit question_path(question)

  fill_in "Answer", with: "He would chuck all the wood that a woodchuck
  could if a woodchuck could chuck wood"
  click_on "Submit Answer"

  expect(page).to have_content "How much wood would a woodchuck chuck if a
  woodchuck could chuck wood?", "Please tell me about the amount of
  wood that a woodchuck would chuck if a woodchuck could chuck wood. Would he
  chuck all the wood that he could? Would he?",
  "He would chuck all the wood that a woodchuck
  could if a woodchuck could chuck wood"
end

scenario "User provides an invalid answer - description too short"

end
