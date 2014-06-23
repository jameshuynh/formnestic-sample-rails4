class QuizPoolQuestionOption < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :quiz_pool_question
end