class AddIndexToComments < ActiveRecord::Migration[5.1]
  def change
    add_index :comments, :commentable_id
  end
end
