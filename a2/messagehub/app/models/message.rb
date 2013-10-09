class Message < ActiveRecord::Base
	belongs_to :app
	validates :content, length: { maximum: 160 }
	validates :username, length: { minimum: 3, maximum: 60 }
end
