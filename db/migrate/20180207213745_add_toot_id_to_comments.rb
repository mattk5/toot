class AddTootIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :toot_id, :integer
  end
end
