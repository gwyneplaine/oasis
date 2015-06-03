module ApplicationHelper
	def login
		nav = ''
		if @current_user.present? && @current_user.is_admin
			nav+='<li class ="inline-block mr2 ">' + link_to('Show users', users_path) + '</li>'
		end
		if @current_user.present?
			nav += '<li class ="inline-block mr2">' + link_to("Edit profile", edit_users_path)+ '</li>'
			nav+='<li class ="inline-block mr2">' + link_to("Logout #{@current_user.name}", login_path, :method => :delete,) + '</li>'
		else
			nav +='<li class ="inline-block mr2">'+ link_to('Sign up', new_user_path) + '</li>'
			nav +='<li class ="inline-block mr2">'+ link_to('Login', login_path) + '</li>'
		end
		nav
	end	
	def timeline_auth
		timeline_nav = ""
		if session[:user_id].present?
			message = "There is no user at the moment"
			timeline = Timeline.find_by(:user_id => session[:user_id])
			timeline_nav += link_to("View Timeline", timeline_path(timeline))
		end
		timeline_nav
	end
end
