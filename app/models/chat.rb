class Chat < ApplicationRecord
    belongs_to :user
end

# data = Chat.where(to:1).or(Chat.where(to: 2))

# data.each do |i| print i.id  or print i.user.name + " => " or puts 
#   i.message or puts  end 