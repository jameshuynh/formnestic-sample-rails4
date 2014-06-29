class QuizPoolQuestion < ActiveRecord::Base
  validates :description, presence: true
  has_many :quiz_pool_question_options
  has_many :correct_quiz_pool_question_options, -> { where(is_correct: true) }, class_name: "QuizPoolQuestionOption", foreign_key: "quiz_pool_question_id" 
  
  accepts_nested_attributes_for :quiz_pool_question_options, allow_destroy: true
  
  validate :at_least_one_correct_option
  
  def at_least_one_correct_option
    if self.correct_quiz_pool_question_options.length == 0
      self.errors.add(:quiz_pool_question_options, :at_least_one_correct_answer)
    end
  end
end
