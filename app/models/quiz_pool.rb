class QuizPool < ActiveRecord::Base
  # attr_accessible :description, :title, :quiz_pool_questions_attributes
  
  has_many :quiz_pool_questions  
  accepts_nested_attributes_for :quiz_pool_questions
end