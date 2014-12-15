require 'rails_helper'

feature "User views all questions" do

  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  it "shows all questions" do
    visit '/questions'
    Question.all.order(updated_at: :desc).each do |question|
      expect(page).to have_contents  question.title
    end
  end
end
