class Author < ActiveRecord::Base

    has_and_belongs_to_many :books
    
    validates :lname, :presence => true
    validates :fname, :presence => true
    
    self.per_page = 10

    def name
        fname + ' ' + lname
    end
end
