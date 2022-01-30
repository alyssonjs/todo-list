class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        p 'current_user'
        p @current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    private

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "Você precisa esta logado para fazer isto"
            redirect_to login_path
        end
    end
end
