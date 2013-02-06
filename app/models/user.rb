class User < ActiveRecord::Base
  attr_accessible :academy, :gender, :name, :student_number
end
