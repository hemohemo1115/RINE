class RoomsController < ApplicationController
  before_action :logged_in_user

  def show
    @messages = Message.all
  end
end
