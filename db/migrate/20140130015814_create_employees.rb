class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.belongs_to :employee_category
      t.string :employee_number
      t.date :joining_date
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.boolean :gender
      t.string :job_title
      t.belongs_to :employee_position
      t.belongs_to :employee_department
      t.belongs_to :reporting_manager
      t.belongs_to :employee_grade
      t.string :qualification
      t.text :experience_detail
      t.integer :experience_year
      t.integer :experience_month
      t.boolean :status
      t.string :status_description
      t.date :date_of_birth
      t.string :marital_status
      t.integer :children_count
      t.string :father_name
      t.string :mother_name
      t.string :husband_name
      t.string :blood_group
      t.belongs_to :nationality
      t.string :home_address_line_1
      t.string :home_address_line2
      t.string :home_city
      t.string :home_state
      t.belongs_to :home_country
      t.string :home_pin_code
      t.string :office_address_line1
      t.string :office_address_line2
      t.string :office_city
      t.string :office_state
      t.belongs_to :office_country
      t.string :office_pin_code
      t.string :office_phone1
      t.string :office_phone2
      t.string :mobile_phone
      t.string :home_phone
      t.string :home_phone
      t.string :email
      t.string :fax
      t.attachment :photo

      t.timestamps
    end
    add_index :employees, :employee_category_id
    add_index :employees, :employee_position_id
    add_index :employees, :employee_department_id
    add_index :employees, :reporting_manager_id
    add_index :employees, :employee_grade_id
    add_index :employees, :nationality_id
    add_index :employees, :home_country_id
    add_index :employees, :office_country_id
  end
end
