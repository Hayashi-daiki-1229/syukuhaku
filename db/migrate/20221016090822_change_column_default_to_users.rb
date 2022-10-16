class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :reserves,:people, from: nil, to: "0"
  end
end
