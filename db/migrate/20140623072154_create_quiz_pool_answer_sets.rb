class CreateQuizPoolAnswerSets < ActiveRecord::Migration
  def change
    create_table :quiz_pool_answer_sets do |t|
      t.integer :quiz_pool_id
      t.string :quiz_taker_name
      t.timestamps
    end
  end
end
