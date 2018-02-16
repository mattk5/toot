class CreateToots < ActiveRecord::Migration[5.1]
  def change
    create_table :toots do |t|
      t.string :author
      t.text :body

      t.timestamps
    end
    add_index :toots, [:user_id, :created_at]
  end
end
