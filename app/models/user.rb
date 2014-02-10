class User < ActiveRecord::Base

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :admin, :employee, :first_name, :last_name, :parent, :student, :username
  attr_accessor :role

  validates_presence_of   :role , :on=>:create
  validates_presence_of   :password, :on => :create

  #has_one :student_record,:class_name=>"Student",:foreign_key=>"user_id"
  belongs_to :employee


  before_save :set_default_role





  def role?(base_role)
    #return !!self.roles.find_by_name(base_role.to_s)
    return "#{t('admin')}" if self.admin?
    return "#{t('student_text')}" if self.student?
    return "#{t('employee_text')}" if self.employee?
    return "#{t('parent')}" if self.parent?
    return nil
  end

  private
  def set_default_role
    if self.new_record?
      self.admin, self.student, self.employee = false, false, false
      self.admin    = true if self.role == 'Admin'
      self.student  = true if self.role == 'Student'
      self.employee = true if self.role == 'Employee'
      self.parent = true if self.role == 'Parent'
    end
    #self.roles << Role.find_by_name('User')
  end


end
