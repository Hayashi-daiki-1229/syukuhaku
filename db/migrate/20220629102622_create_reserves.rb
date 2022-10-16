class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.integer :people

      t.timestamps
    end
  end
end
