class Author < ActiveRecord::Base

    has_and_belongs_to_many :books
    
    validates :lname, :presence => true
    validates :fname, :presence => true
    
    def name
        fname + ' ' + lname
    end
end
