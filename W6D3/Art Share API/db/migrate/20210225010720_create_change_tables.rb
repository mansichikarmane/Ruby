class CreateChangeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :change_tables do |t|


    end
    rename_column :users, :name, :username
    add_index :users, :username, unique: true
    remove_column :users, :email
  end
end
