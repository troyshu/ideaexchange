class TempDescription < ActiveRecord::Base
  attr_accessible :description
  validates_length_of :description
end
