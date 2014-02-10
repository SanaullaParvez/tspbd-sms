class CreateSchoolDetails < ActiveRecord::Migration
  def change
    create_table :school_details do |t|
      t.integer :school_id
      t.attachment :logo
      t.timestamps
    end
  end
end
