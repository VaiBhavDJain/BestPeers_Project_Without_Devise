class ChattingController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @user_all = User.all
    end

    def show 

      @user = User.find(params[:user_id])
      @friend = User.find(params[:id])
      @chats = Chat.where(user_id: params[:user_id], to: params[:id] ).or(Chat.where(user_id: params[:id],to: params[:user_id])).order(id: :asc)
    end

    def create
      @user = User.find(params[:user_id])
      @friend = User.find(params[:format])

      @chat= @user.chats.new(to: @friend.id , message: chats_params,date: "#{Date.today.day}/#{Date.today.month}/#{Date.today.year}",time:Time.now.strftime("%I:%M:%S %p"))
      if @chat.save 
         redirect_to user_chatting_path(@user.id,@friend.id), vaibhav_flash: 'Chat Succesfully Sent'
      else
         byebug
          render('show')
      end
    end

    private
    def chats_params
      data = params.require(:chat).permit(:message)
      return data[:message]
    end
end
