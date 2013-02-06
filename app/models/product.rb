class Product < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  validates :name, :length => { :within => 1..2}

end