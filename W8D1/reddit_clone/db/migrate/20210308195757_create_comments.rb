class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :commenter_id

      t.timestamps
    end
    add_index :comments, :commenter_id
  end
end
