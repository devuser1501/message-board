class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end

  ## ここから追記
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end




  private
  def message_params
    #binding.pry
    params.require(:message).permit(:name, :body)
  end
  ## ここまで
end