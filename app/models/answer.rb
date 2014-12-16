class Answer < ActiveRecord::Base
  validates :description,
    presence: true
  validates :question_id,
    presence: true

  belongs_to :question
end
