class AddUserIdToReserves < ActiveRecord::Migration[6.1]
  def change
    add_column :reserves, :room_id, :integer
  end
end
