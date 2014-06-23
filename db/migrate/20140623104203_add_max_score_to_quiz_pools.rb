class AddMaxScoreToQuizPools < ActiveRecord::Migration
  def change
    add_column :quiz_pools, :max_score, :integer, default: 0
    add_column :quiz_pools, :correct_percentage, :float, default: 0
  end
end
