class QuizPoolQuestionOption < ActiveRecord::Base
  # attr_accessible :description, :is_correct, :quiz_pool_question_id
  validates :description, presence: true
end