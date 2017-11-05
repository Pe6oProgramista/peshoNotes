class Post < ApplicationRecord
    before_create :generate_random_id
     private 
     def generate_random_id
       self.id = SecureRandom.hex(8)
     end 
end
