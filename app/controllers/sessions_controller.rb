class SessionsController < ApplicationController

    def new
    end

    # create new session
    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to user
            # byebug
        else
            flash.now[:danger] = "There was a problem with your login information."
            render :new
        end
    end

    # logout
    def destroy
        session.clear
        # flash[:success] = "You have successfully logged out" 
        redirect_to root_path
    end
end
