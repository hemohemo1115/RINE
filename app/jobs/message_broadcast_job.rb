class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    #ActionCable.server.broadcast 'room_channel', message: render_message(message)
    #DM機能用
    #ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message)
    #RoomChannel.broadcast_to "room_channel_#{message.room_id}", message: render_message(message)
  end

  private

    def render_message(message)
      #puts "AAAAAAAAAAAAAAAAAA" デバッグ用
      ApplicationController.renderer.render partial: 'messages/message', locals: { message: message }
    end
end
