class EmployeeGrade < ActiveRecord::Base
  has_many :employees
  attr_accessible :max_hours_day, :max_hours_week, :name, :priority, :status
end
