class CreateEmployeePositions < ActiveRecord::Migration
  def change
    create_table :employee_positions do |t|
      t.string :name
      t.belongs_to :employee_category
      t.boolean :status
    end
    add_index :employee_positions, :employee_category_id
  end
end
