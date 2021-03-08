class RenameSubSubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id
    rename_column :post_subs, :subs_id, :sub_id
  end
end
