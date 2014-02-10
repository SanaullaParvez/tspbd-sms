class Employee < ActiveRecord::Base
  #extend FriendlyId
  #friendly_id :employee_number, use: :slugged
  belongs_to :employee_category
  belongs_to :employee_position
  belongs_to :employee_department
  belongs_to :reporting_manager
  belongs_to :employee_grade
  belongs_to :nationality, :class_name => 'Country'
  belongs_to :home_country
  belongs_to :office_country
  has_one :user, :dependent=>:destroy, :autosave => true, :foreign_key=>'username', :primary_key => 'employee_number'



  attr_accessible :blood_group, :children_count, :date_of_birth, :email, :employee_number, :experience_detail, :experience_month, :experience_year, :father_name, :fax, :first_name, :gender, :home_address_line2, :home_address_line_1, :home_city, :home_phone, :home_phone, :home_pin_code, :home_state, :husband_name, :job_title, :joining_date, :last_name, :marital_status, :middle_name, :mobile_phone, :mother_name, :office_address_line1, :office_address_line2, :office_city, :office_phone1, :office_phone2, :office_pin_code, :office_state, :photo, :qualification, :status, :status_description, :photo, :employee_department_id, :employee_category_id, :employee_position_id, :employee_grade_id, :nationality_id
  has_attached_file :photo,
                    :styles => {:original=> "125x125#" },
                    :default_url => "/assets/default_employee.png",
                    :url => "/assets/:class/:id_:employee_number.:extension",
                    :path => ":rails_root/app/assets/images/:class/:id_:employee_number.:extension"


  VALID_IMAGE_TYPES = ['image/gif', 'image/png','image/jpeg', 'image/jpg']
  validates_attachment_content_type :photo, :content_type =>VALID_IMAGE_TYPES,
                                    :message=>'Image can only be GIF, PNG, JPG',:if=> Proc.new { |p| !p.photo_file_name.blank? }
  validates_attachment_size :photo, :less_than => 512000,
    :message=>'must be less than 500 KB.',:if=> Proc.new { |p| p.photo_file_name_changed? }


  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i, :message => 'must be a valid email address'

  #validates_associated :user
  before_validation :create_user_and_validate

  def create_user_and_validate
    if self.new_record?
      user_record = self.build_user
      user_record.first_name = self.first_name
      user_record.last_name = self.last_name
      #user_record.username = self.employee_number.to_s
      user_record.email = self.email
      user_record.password = self.employee_number.to_s + "123456789"
      user_record.role = 'Admin'
      user_record.email = self.email.blank? ? '' : self.email.to_s
      check_user_errors(user_record)
    else
      changes_to_be_checked = ['employee_number','first_name','last_name','email']
      check_changes = self.changed & changes_to_be_checked
      unless check_changes.blank?
        emp_user = self.user
        emp_user.username = self.employee_number if check_changes.include?('employee_number')
        emp_user.password = self.employee_number.to_s + "123" if check_changes.include?('employee_number')
        emp_user.first_name = self.first_name if check_changes.include?('first_name')
        emp_user.last_name = self.last_name if check_changes.include?('last_name')
        emp_user.email = self.email.to_s if check_changes.include?('email')
        emp_user.save if check_user_errors(self.user)
      end
    end
  end

  def check_user_errors(user)
    unless user.valid?
      user.errors.each{|attr,msg| errors.add(attr.to_sym,"#{msg}")}
    end
    user.errors.blank?
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end


end
