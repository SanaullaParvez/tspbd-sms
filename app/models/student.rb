class Student < ActiveRecord::Base
  belongs_to :batch
  belongs_to :nationality, :class_name => 'Country'
  belongs_to :student_category
  belongs_to :country
  belongs_to :immediate_contact
  has_one :user, :dependent=>:destroy, :autosave => true, :foreign_key=>'username', :primary_key => 'admission_no'

  attr_accessible :batch_id, :student_category_id, :immediate_contact_id, :country_id, :address_line1, :address_line2, :admission_date, :admission_no, :birth_place, :blood_group, :city, :class_roll_no, :date_of_birth, :email, :first_name, :gender, :has_paid_fees, :is_active, :is_deleted, :is_sms_enabled, :language, :last_name, :middle_name, :phone1, :phone2, :photo, :pin_code, :religion, :state, :status_description, :nationality_id, :photo

  has_attached_file :photo,
                    :styles => {:original=> "125x125#" },
                    :default_url => "/assets/default_student.png",
                    :url => "/assets/:class/:id_:admission_no.:extension",
                    :path => ":rails_root/app/assets/images/:class/:id_:admission_no.:extension"


  VALID_IMAGE_TYPES = ['image/gif', 'image/png','image/jpeg', 'image/jpg']
  validates_attachment_content_type :photo, :content_type =>VALID_IMAGE_TYPES,
                                    :message=>'Image can only be GIF, PNG, JPG',:if=> Proc.new { |p| !p.photo_file_name.blank? }
  validates_attachment_size :photo, :less_than => 512000,
                            :message=>'must be less than 500 KB.',:if=> Proc.new { |p| p.photo_file_name_changed? }

  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i, :message => 'must be a valid email address'

  before_validation :create_user_and_validate

  def create_user_and_validate
    if self.new_record?
      user_record = self.build_user
      user_record.first_name = self.first_name
      user_record.last_name = self.last_name
      #user_record.username = self.employee_number.to_s
      user_record.password = self.admission_no.to_s + "123456789"
      user_record.role = 'Student'
      user_record.email = self.email.blank? ? '' : self.email.to_s
      check_user_errors(user_record)
    else
      changes_to_be_checked = ['admission_no','first_name','last_name','email']
      check_changes = self.changed & changes_to_be_checked
      unless check_changes.blank?
        emp_user = self.user
        emp_user.username = self.employee_number if check_changes.include?('admission_no')
        emp_user.password = self.employee_number.to_s + "123" if check_changes.include?('admission_no')
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
