class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

	validates :username, uniqueness: true #checks if username is already in use
	validates :username, presence: true #checks that a username is there
end
