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
    q1 = Question.create!(title: "Oh where, oh where has my little dog gone?
    Oh where, oh where can he be?", description: "With his ears cut short And
    his tail cut long Oh where, oh where can he be? I think he went down To
    the building site To see what he could see And in his mouth. Was a globe so
    bright I wonder what could it be" )

    q2 = Question.create!(title: "How much wood would a woodchuck chuck if a
    woodchuck could chuck wood?", description: "Please tell me about the amount
    of wood that a woodchuck would chuck if a woodchuck could chuck wood.
    Would he chuck all the wood that he could? Would he?" )

    visit '/questions'

    expect(page).to have_content  q1.title, q2.title
    q2.title.should appear_before(q1.title)
  end
end
