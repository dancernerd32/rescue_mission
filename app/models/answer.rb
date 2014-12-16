class Answer < ActiveRecord::Base
  validates :description,
    presence: true, length: {minimum: 50}
  validates :question_id,
    presence: true

  belongs_to :question
end
