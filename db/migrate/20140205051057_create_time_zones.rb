class CreateTimeZones < ActiveRecord::Migration
  def change
    create_table :time_zones do |t|
      t.string :name
      t.string :code
      t.string :difference_type
      t.integer :time_difference

      t.timestamps
    end
  end
end
