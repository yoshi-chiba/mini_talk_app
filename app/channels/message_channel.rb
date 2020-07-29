# ①rails sした段階でこのファイルが読み込まれる

# サーバーとチャネルを繋ぐ、ルーティングの役割を果たす機能
class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_fromメソッドを使用することでモデルとチャネルを結びつけることができる
    # stream_fromメソッドはAction Cableが所有しているメソッドである
    # このように記述することで、broadcast（メッセージの通り道）を介してメッセージを送信することができる
    # rails sした段階でここが読み込まれる
    stream_from "message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
