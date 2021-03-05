class RegistrationsController < ApplicationController
    before_action :one_user_registered?, only: [:new, :create] # Admin authentication
    
    protected 

    def one_user_registered? # This method allows only one registration
        if User.count == 1
            if user_signed_in? 
                redirect_to root_path 
            else
                redirect_to new_user_session_path
            end
        end
    end

end
