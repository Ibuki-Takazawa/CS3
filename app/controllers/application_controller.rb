class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def create
        user = User.find_by(uid: params[:session][:uid])
        if user && BCrypt::Password.new(user.pass) == params[:session][:pass]
            session[:login_uid] = user.uid
            redirect_to '/top/main'
        else
            flash.now[:alert] = 'ログインに失敗しました'
            render 'top/error'
        end
    end


  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
