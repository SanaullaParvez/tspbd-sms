class EmployeePosition < ActiveRecord::Base
  belongs_to :employee_category
  has_many :employees
  attr_accessible :name, :status, :employee_category_id
end
