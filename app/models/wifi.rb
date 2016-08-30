class Wifi < ActiveRecord::Base
	belongs_to :user
	geocoded_by :address, :latitude  => :lat, :longitude => :long

	has_many :connections, dependent: :destroy
end
