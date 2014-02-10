class EmployeeCategory < ActiveRecord::Base
  has_many :employees
  has_many :employee_positions
  attr_accessible :name, :prefix, :status
end
