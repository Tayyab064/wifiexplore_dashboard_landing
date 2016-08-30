class Connection < ActiveRecord::Base
	belongs_to :wifi
	belongs_to :user

	has_one :rating

	validates_presence_of :connected_at

	#after_create :calculate_bill
	#after_update :calculate_bill


	def calculate_bill
		self.total_bill = ((self.download_data * self.wifi.price)/100).round(2)
		self.save
	end
end
