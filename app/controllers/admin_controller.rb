class AdminController < ApplicationController
	before_action :authenticate_admin!
	layout 'dashboard'

	def index
		@users = User.all.count
		@wifis = Wifi.all
		@connections = Connection.all
		@total_earning = 0
		@download_data = 0
		@upload_data = 0
		Connection.all.each do |conn|
			@total_earning = @total_earning + conn.total_bill
			@download_data = @download_data + conn.download_data
			@upload_data = @upload_data + conn.upload_data
		end
	end

	def wifi_table
		@wifi = Wifi.all.order(updated_at: 'DESC')
	end

	def wifi_map
		@wifi = Wifi.all
	end

	def users
		@user = User.all.order(updated_at: 'DESC')
	end

	def connections
		@connection = Connection.all.order(updated_at: 'DESC')
	end
end
