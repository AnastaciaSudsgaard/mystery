class CreateTimeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :time_items do |t|
      t.text :description
      t.boolean :completed
      t.datetime :completed_at
      t.references :time_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
