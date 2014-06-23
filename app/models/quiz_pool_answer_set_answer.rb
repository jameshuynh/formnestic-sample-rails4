class QuizPoolAnswerSetAnswer < ActiveRecord::Base
  belongs_to :quiz_pool_answer_set
  belongs_to :quiz_pool_question
  has_many :quiz_pool_answer_set_answer_quiz_pool_question_options, dependent: :destroy
  has_many :quiz_pool_question_options, through: :quiz_pool_answer_set_answer_quiz_pool_question_options
  
  def is_correct?
    chosen_option_ids = self.quiz_pool_question_options.collect(&:id).sort
    correct_otion_ids = self.quiz_pool_question.correct_quiz_pool_question_options.collect(&:id).sort
    return chosen_option_ids == correct_otion_ids
  end
end