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
		@connected_user = Connection.where(disconnected_at: nil).count
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
		@total_earning = 0
		@download_data = 0
		@upload_data = 0
		Connection.all.each do |conn|
			@total_earning = @total_earning + conn.total_bill
			@download_data = @download_data + conn.download_data
			@upload_data = @upload_data + conn.upload_data
		end
	end

	def payments
		@wifi = Wifi.all
		@wifi_earning = ''
		@wifi_conn = ''
		@total_earning = 0
		@avg_con = ( Connection.all.count / Wifi.all.count ).round
		Connection.all.each do |conn|
			@total_earning = @total_earning + conn.total_bill
		end
		Wifi.all.order(updated_at: 'DESC').limit(50).each do |wif|
			
			temp_wifi_earning = ''
			wif.connections.each do |coni|
				if(temp_wifi_earning == '')
					temp_wifi_earning = ((coni.total_bill)/1000).round(2).to_s
				else
					temp_wifi_earning = temp_wifi_earning + ","+ ((coni.total_bill)/1000).round(2).to_s
				end
			end
			if(@wifi_earning == '' || @wifi_conn)
				@wifi_earning = temp_wifi_earning
				@wifi_conn = wif.connections.count.to_s
			else
				@wifi_earning = @wifi_earning + ","+ temp_wifi_earning
				@wifi_conn = @wifi_conn + "," + wif.connections.count.to_s
			end
		end
	end

	def redir_dash
		redirect_to dashboard_path
	end
end
