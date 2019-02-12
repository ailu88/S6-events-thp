class Updatedatabaseevents < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email
    remove_column :users, :encrypted_password
  end
end
