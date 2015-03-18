class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
	private

	def check_for_mobile
  		session[:mobile_override] = params[:mobile] if params[:mobile]
  		prepare_for_mobile if mobile_device?
	end

	def prepare_for_mobile
  		prepend_view_path Rails.root + 'app' + 'views_mobile'
	end
	
	def mobile_device?
  		if session[:mobile_override]
    		session[:mobile_override] == "1"
  		else
    		(request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
  		end
	end

	helper_method :mobile_device?

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end
end
