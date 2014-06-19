class CreateQuizPools < ActiveRecord::Migration
  def change
    create_table :quiz_pools do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
