class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    @trade = Trade.find_by(chat_room: @chat_room)
    unless current_user == @trade.benefit.event.user || current_user == @trade.user
      flash[:alert] = "you're not allowed to join this chat"
      redirect_to event_path(@chat_room.trade.benefit.event)
    end
  end
end
