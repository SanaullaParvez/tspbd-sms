class EmployeeDepartment < ActiveRecord::Base
  has_many :employees
  attr_accessible :code, :name, :status
end
