class RenamePrefenctureIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :prefencture_id, :prefecture_id
  end
end
