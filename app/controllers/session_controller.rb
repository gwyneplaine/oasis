class SessionController < ApplicationController
	def new
	end
	def create
		user = User.find_by :username => params[:username]
		if user.present? && user.authenticate(params[:password])
			session[:user_id] = user.id 
			iptest = request.remote_ip
			ipcook = cookies[:longlat]
			@iptestopj = Geocoder.search(iptest)
			@iptestaddress = Geocoder.address('23 York St Sydney')
			user.location_id = get_location(@iptestaddress)
			user.save
			redirect_to root_path
		else
			flash[:notice] = "Invalid Login, please try again"
			redirect_to login_path
		end
	end
	def destroy
		session[:user_id]=nil
		redirect_to root_path
	end
end