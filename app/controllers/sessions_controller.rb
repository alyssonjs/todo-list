class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:create]

    def create 
        user = User.find_by(email:login_params[:email].downcase)
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id

            redirect_to "/users/#{session[:user_id]}/categories"
        else
            flash[:notice] = 'Algo está errado, confira seu email ou senha.'
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Você está deslogado'
        redirect_to login_path
    end

    private 

    def login_params
        params.require(:login).permit(:email, :password)
    end
end
