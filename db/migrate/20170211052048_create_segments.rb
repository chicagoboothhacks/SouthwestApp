class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :origin
      t.datetime :flt_time
      t.datetime :checkin_time
      t.references :reservation, type: :string
      t.timestamps
    end
  end
end
