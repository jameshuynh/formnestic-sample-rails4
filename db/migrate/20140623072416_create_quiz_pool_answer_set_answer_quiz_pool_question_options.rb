class CreateQuizPoolAnswerSetAnswerQuizPoolQuestionOptions < ActiveRecord::Migration
  def change
    create_table :quiz_pool_answer_set_answer_quiz_pool_question_options do |t|
      t.integer :quiz_pool_answer_set_answer_id
      t.integer :quiz_pool_question_option_id

      t.timestamps
    end
    
    add_index :quiz_pool_answer_set_answer_quiz_pool_question_options, [:quiz_pool_answer_set_answer_id, :quiz_pool_question_option_id], name: ["option_answer_index"]
  end
end
