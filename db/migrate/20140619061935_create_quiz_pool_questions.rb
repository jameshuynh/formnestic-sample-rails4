class CreateQuizPoolQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_pool_questions do |t|
      t.text :description
      t.integer :score
      t.integer :quiz_pool_id

      t.timestamps
    end
  end
end
