class Post < ApplicationRecord
     before_create :generate_random_id
     private
     def generate_random_id
       loop do
         self.id = SecureRandom.hex(8)
         break unless Post.where(id: id).exists?
       end
   end
end
