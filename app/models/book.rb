class Book < ActiveRecord::Base
    has_and_belongs_to_many :authors
    has_many :comments
    
    validates :name, :presence => true
    validates :authors, :presence => true
    
    self.per_page = 10
    
end
