class Comment < ActiveRecord::Base
  belongs_to :book
  
  validates :content, :presence => true
end
