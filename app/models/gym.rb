class Gym < ApplicationRecord
	belongs_to :admin
	has_many :membership_types
	has_many :checkins
end
