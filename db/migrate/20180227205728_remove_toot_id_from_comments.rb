class RemoveTootIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :toot_id, :integer
  end
end
