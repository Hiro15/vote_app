class SessionsController < ApplicationController

    def show
     @user = User.find(params[:id])
    end


    def new
    end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to boards_view_path
      else
        flash[:danger] = 'Invalid email/password combination'
        redirect_to boards_view_path
      end
    end

    def destroy
      log_out
      redirect_to boards_view_path
    end

    def unsub
      @user = User.find(current_user.id)
      @user.destroy
      redirect_to boards_view_path
    end

    private




  end
