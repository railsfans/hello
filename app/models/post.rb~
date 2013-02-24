class Post < ActiveRecord::Base
  attr_accessible :content, :title, :status
  validates_presence_of :title,:content
  DAYS=['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  def self.search(search)
  if search
  where('created_at like ?', "%#{search}%")
  else
  # all
  scoped
  end
  end
end
