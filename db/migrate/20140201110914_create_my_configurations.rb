class CreateMyConfigurations < ActiveRecord::Migration
  def change
    create_table :my_configurations do |t|
      t.string :config_key
      t.string :config_value
    end
  end
end
