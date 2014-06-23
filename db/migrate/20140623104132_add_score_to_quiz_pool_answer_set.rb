class AddScoreToQuizPoolAnswerSet < ActiveRecord::Migration
  def change
    add_column :quiz_pool_answer_sets, :score, :integer, default: 0
    add_column :quiz_pool_answer_sets, :correct_percentage, :float, default: 0
  end
end
