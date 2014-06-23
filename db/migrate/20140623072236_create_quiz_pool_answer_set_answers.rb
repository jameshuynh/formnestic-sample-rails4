class CreateQuizPoolAnswerSetAnswers < ActiveRecord::Migration
  def change
    create_table :quiz_pool_answer_set_answers do |t|
      t.integer :quiz_pool_answer_set_id
      t.integer :quiz_pool_question_id

      t.timestamps
    end
  end
end
