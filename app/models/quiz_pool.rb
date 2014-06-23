require 'csv'
class QuizPool < ActiveRecord::Base
  has_many :quiz_pool_questions  
  has_many :quiz_pool_answer_sets
  accepts_nested_attributes_for :quiz_pool_questions, allow_destroy: true
  
  before_save :calculate_max_score
  
  def calculate_max_score
    self.max_score = self.quiz_pool_questions.collect(&:score).sum
  end
  
  def answer_sets_csv
    headers = ["No.", "Taken At", "Taker's Name", "Score", "Correct Percentage"]
    quiz_pool_questions.each_with_index do |question, index|
      headers += ["Question ##{index + 1}: #{question.description}"]
    end
    
    CSV.generate do |csv|
      csv << headers
      quiz_pool_answer_sets.each_with_index do |answer_set, index|
        data = [index + 1, answer_set.created_at.strftime("%d-%m-%Y %H:%M:%S"), answer_set.quiz_taker_name, answer_set.score, "#{(answer_set.correct_percentage * 100)}%"]
        quiz_pool_questions.each_with_index do |question, index|
          data << answer_set.quiz_pool_answer_set_answers.detect{|x| x.quiz_pool_question_id == question.id}.quiz_pool_question_options.collect(&:description).join("\n")
        end
        csv << data
      end
    end
  end
  
end