class NotNullUserIDofBoard < ActiveRecord::Migration
  def up
    change_column :boards, :user_id, :integer, null: false
  end

  def down
    change_column :boards, :user_id, :integer, null: true
  end
end
