class Product < ActiveRecord::Base
  attr_accessible :name, :price
  validates_presence_of :name
  # validates :name, :length => { :within => 1..2}
  def self.search(search)
  if search
  where('created_at like ?', "%#{search}%")
  else
  # all
  scoped
  end
  end 
  def self.total_on(date)
  where("date(created_at) = ?", date).sum(:price)
  end
  
#  def self.between_with(startTime, endTime)
#  where(['created_at >= ? and created_at <?', startTime, endTime])
#  end
  
  belongs_to :user
end
