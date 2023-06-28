class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user][:username])

    if @user and @user.password == params[:user][:password]
      session = @user.session.create
      cookies.permanent.signed[:todolist_session_token] = {
        value: session.token,
        httponly: true
      }

      render json: {
        success: true
      }
    else 
      render json: {
        success: false
      }
    end
  end

  def authenticated
  end

  def destroy
  end
end
