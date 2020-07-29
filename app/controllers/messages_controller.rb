class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    # ③メッセージ送信後はcreateアクションが発火する

    # パラメーターの形は、"message"=>{"text"=>"aaa"}
    @message = Message.new(text: params[:message][:text])
    if @message.save
      # broadcastとはメッセージの通り道である
      # 直訳すると、message_channelに向けてbroadcastを介して@messageを送信すると言うことになる
      # 送信された@messagesはmessage_channel.jsで受け取られる
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end
end
