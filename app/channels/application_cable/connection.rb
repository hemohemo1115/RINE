module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected
    def find_verified_user
      #verified_user = User.find_by(id: env['warden'].user.id)
      #return reject_unauthorized_connection unless verified_user
      #verified_user
      #puts "000000000000" デバッグ用
      #puts User.find_by(id: cookies.encrypted[:user_id]) デバッグ用
      if verified_user = User.find_by(id: cookies.encrypted[:user_id])
        verified_user
      else
        reject_unauthorized_connection
      end
      #if (user_id = session[:user_id])
      #    @current_user ||= User.find_by(id: user_id)
      #elsif (user_id = cookies.signed[:user_id])
      #    user = User.find_by(id: user_id)
      #    if user && user.authenticated?(cookies[:remember_token])
      #      log_in user
      #      @current_user = user
      #    end
      #end
    end
  end
end
