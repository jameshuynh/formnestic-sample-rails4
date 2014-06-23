class QuizPoolAnswerSetAnswerQuizPoolQuestionOption < ActiveRecord::Base
  belongs_to :quiz_pool_question_option
  belongs_to :quiz_pool_answer_set_answer
end
