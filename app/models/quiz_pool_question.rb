class QuizPoolQuestion < ActiveRecord::Base
  # attr_accessible :description, :quiz_pool_id, :score, :quiz_pool_question_options_attributes
  
  validates :description, presence: true
  has_many :quiz_pool_question_options
  accepts_nested_attributes_for :quiz_pool_question_options, allow_destroy: true
end
