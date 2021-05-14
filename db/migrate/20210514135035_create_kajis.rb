class CreateKajis < ActiveRecord::Migration[6.0]
  def change
    create_table :kajis do |t|
      t.string :name,            null: false
      t.integer :score,            null: false
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
