class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :text
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
