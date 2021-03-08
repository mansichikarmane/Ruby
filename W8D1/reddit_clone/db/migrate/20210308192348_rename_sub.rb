class RenameSub < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_subs, :sub_id, :subs_id
  end
end
