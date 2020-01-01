class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    unless current_user == @chat_room.trade.benefit.event.user || current_user == @chat_room.trade.user
      flash[:alert] = "you're not allowed to join this chat"
      redirect_to event_path(@chat_room.trade.benefit.event)
    end
  end
end
