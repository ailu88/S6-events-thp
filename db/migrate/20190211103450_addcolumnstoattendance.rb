class Addcolumnstoattendance < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :event_id, :integer
    add_column :attendances, :attendant_id, :integer
  end
end
