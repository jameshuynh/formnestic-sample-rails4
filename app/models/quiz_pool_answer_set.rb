class QuizPoolAnswerSet < ActiveRecord::Base
  belongs_to :quiz_pool  
  has_many :quiz_pool_answer_set_answers, dependent: :destroy
  validates :quiz_taker_name, presence: true
  accepts_nested_attributes_for :quiz_pool_answer_set_answers
  after_initialize do |quiz_pool_answer_set|
    if quiz_pool_answer_set.new_record? and quiz_pool_answer_set.quiz_pool
      quiz_pool_answer_set.quiz_pool.quiz_pool_questions.each do |question|
        quiz_pool_answer_set.quiz_pool_answer_set_answers.build({quiz_pool_question: question})
      end
    end
  end
  
  before_save :calculate_score_and_correct_percentage
  
  def calculate_score_and_correct_percentage
    gained_score = 0
    self.quiz_pool_answer_set_answers.each do |answer|
      if answer.is_correct?
        gained_score += answer.quiz_pool_question.score
      end
    end
    
    self.score = gained_score
    self.correct_percentage = (self.score * 1.0 / self.quiz_pool.max_score).round(2)
  end
  
end
