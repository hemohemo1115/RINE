class RoomsController < ApplicationController
  before_action :logged_in_user

  def show
    @messages = Message.all
    @current_user = current_user
  end

  private

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
