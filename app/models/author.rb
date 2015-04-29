class Author < ActiveRecord::Base
	validates :name, presence: true
	has_many :todos
	has_secure_password
	validates :password, length: { within: 6..15 }
end
