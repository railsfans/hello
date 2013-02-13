class Product < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  validates :name, :length => { :within => 1..2}
  def self.search(search)
  if search
  where('name like ?', "%#{search}%")
  else
  # all
  scoped
  end
  end
end
