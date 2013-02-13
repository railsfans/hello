class User < ActiveRecord::Base
  attr_accessible :academy, :gender, :name, :student_number
def self.search(search)
  if search
  where('name like ?', "%#{search}%")
  else
  # all
  scoped
  end
end
end
