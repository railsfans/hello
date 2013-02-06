class Post < ActiveRecord::Base
  attr_accessible :content, :title, :status
  validates_presence_of :title,:content
end
