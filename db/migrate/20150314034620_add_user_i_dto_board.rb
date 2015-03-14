class AddUserIDtoBoard < ActiveRecord::Migration
  def change
    add_column :boards, :user_id, :integer
    add_foreign_key :boards, :users
  end
end
