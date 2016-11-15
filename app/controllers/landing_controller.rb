class LandingController < ApplicationController

	def landing

	end

	def show_wifi
		if Wifi.exists?(params[:id])
			@wifi = Wifi.find(params[:id])
		else
			redirect_to root_path
		end
	end
end
