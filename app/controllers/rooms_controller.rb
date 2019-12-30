class RoomsController < ApplicationController
  before_action :logged_in_user

  def show
    #オープンチャット機能用
    #@messages = Message.all
    #@current_user = current_user
    #DM機能用
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    current_user.rooms.create
    @rooms = Room.all.order(:id)
    #render action: :index
    redirect_to root_path
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
