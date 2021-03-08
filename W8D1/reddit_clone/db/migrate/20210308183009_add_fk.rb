class AddFk < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :moderator_id, :integer
  end
end
