class Dinosaur < ActiveRecord::Base
 scope :with_name, lambda {|parameter| where("name like ?", "%#{parameter}%")}     
 scope :taller_than, lambda {|parameter| where("height > ?", parameter)}

 def self.search(parameters)
   dinosaur_query = self.scoped
   parameters.each do |parameter, value|
     if not value.empty? and dinosaur_query.respond_to? parameter
       dinosaur_query = dinosaur_query.send(parameter, value) 
     end
   end
   dinosaur_query
 end
end
