class PaymentMethod < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :card_number , :expiry , :cvn
end
