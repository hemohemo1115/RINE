class RoomChannel < ApplicationCable::Channel
  def subscribed
    #オープンチャット機能用
    #stream_from "room_channel"
    #DM機能用
    stream_from "room_channel_#{params['room']}" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    #ActionCable.server.broadcast("room_channel_#{params['room']}", data)
  end

  def speak(data)
    #オープンチャット機能用
    #Message.create! content: data['message'], user_id: data['current_user_id'], user_name: data['current_user_name']
    #DM機能用
    #Message.create! content: data['message'], user_id: data['current_user_id'], user_name: data['current_user_name'], room_id: params['room']
    #@user = data['current_user']
    #puts @user
    #puts current_user
    puts "oooooooooooooo"
    #puts current_user.id
    
    messages = current_user.messages.create(content: data['message'], user_id: data['current_user_id'], user_name: data['current_user_name'], room_id: params['room'])
    ActionCable.server.broadcast("room_channel_#{params['room']}", message: render_message(messages))
  end

  private

    def render_message(message)
      puts "AAAAAAAAAAAAAAAAAA"
      ApplicationController.renderer.render partial: 'messages/message', locals: { message: message }
    end
end
