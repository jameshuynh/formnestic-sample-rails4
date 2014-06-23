class ChangeScoreInQuizPoolQuestionsToInteger < ActiveRecord::Migration
  def change
    change_column :quiz_pool_questions, :score, :integer
  end
end
