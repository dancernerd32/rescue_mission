class Question < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 40}
end
