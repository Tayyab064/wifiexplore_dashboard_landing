class Wifi < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :avg_speed
	geocoded_by :address, :latitude  => :lat, :longitude => :long

	has_many :connections, dependent: :destroy
end
