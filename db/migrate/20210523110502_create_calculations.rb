class CreateCalculations < ActiveRecord::Migration[6.0]
  def change
    create_table :calculations do |t|
      t.integer :time,            null: false
      t.integer :housework_score
      t.integer :sum
      t.references :user, null: false, foreign_key: true
      t.references :housework, null: false, foreign_key: true
      t.timestamps
    end
  end
end
