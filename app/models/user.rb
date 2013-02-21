class User < ActiveRecord::Base
  attr_accessible :door_id, :rating, :academy, :gender, :name, :student_number, :price, :born_on, :product_id
validates_presence_of :name
has_many :products
belongs_to :door
end
