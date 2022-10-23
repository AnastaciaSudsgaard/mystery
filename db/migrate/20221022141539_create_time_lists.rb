class CreateTimeLists < ActiveRecord::Migration[6.1]
  def change
    create_table :time_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
