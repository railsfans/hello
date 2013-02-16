class User < ActiveRecord::Base
  attr_accessible :academy, :gender, :name, :student_number, :price, :born_on, :product_id
 
has_many :products
end
