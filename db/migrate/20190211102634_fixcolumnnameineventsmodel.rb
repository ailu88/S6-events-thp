class Fixcolumnnameineventsmodel < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :user_id, :admin_id
  end
end
