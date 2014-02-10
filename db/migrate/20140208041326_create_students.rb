class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :admission_no
      t.string :class_roll_no
      t.date :admission_date
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.belongs_to :batch
      t.date :date_of_birth
      t.string :gender
      t.string :blood_group
      t.string :birth_place
      t.belongs_to :nationality
      t.string :language
      t.string :religion
      t.belongs_to :student_category
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :pin_code
      t.belongs_to :country
      t.string :phone1
      t.string :phone2
      t.string :email
      t.belongs_to :immediate_contact
      t.boolean :is_sms_enabled
      t.attachment :photo
      t.string :status_description
      t.boolean :is_active
      t.boolean :is_deleted
      t.boolean :has_paid_fees

      t.timestamps
    end
    add_index :students, :batch_id
    add_index :students, :nationality_id
    add_index :students, :student_category_id
    add_index :students, :country_id
    add_index :students, :immediate_contact_id
  end
end
