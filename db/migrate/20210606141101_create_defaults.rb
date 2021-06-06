class CreateDefaults < ActiveRecord::Migration[6.0]
  def change
    create_table :defaults do |t|
      t.integer :default_time
      t.references :housework, null: false, foreign_key: true

      t.timestamps
    end
  end
end
