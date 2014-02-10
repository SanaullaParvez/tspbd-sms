class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.boolean :student
      t.boolean :employee
      t.boolean :parent

      t.timestamps
    end
  end
end
