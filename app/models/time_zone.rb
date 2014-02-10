class TimeZone < ActiveRecord::Base
  attr_accessible :code, :difference_type, :name, :time_difference
end
