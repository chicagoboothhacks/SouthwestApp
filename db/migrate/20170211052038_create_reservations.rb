class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations, id: false do |t|
      t.string :rcrd_loc
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :a_list
      t.timestamps
    end
    
    add_index :reservations, :rcrd_loc, unique: true
  end
end
