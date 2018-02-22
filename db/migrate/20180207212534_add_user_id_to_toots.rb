class AddUserIdToToots < ActiveRecord::Migration[5.1]
  def change
    add_column :toots, :user_id, :integer
  end
end
