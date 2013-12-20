class Responsible < ActiveRecord::Base
	has_many :bills
	validates :name, presence: true
	validates :email, presence: true			
end
