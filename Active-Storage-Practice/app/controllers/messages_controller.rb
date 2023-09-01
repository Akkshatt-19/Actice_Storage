class MessagesController < ApplicationController

    def index
        render json: Message.all
    end

    def create
      message = Message.new(message_params)
      if message.save
        render json: message, status: :created
      else
        render json: message.errors, status: :unprocessable_entity
      end
    end

    def def destroy
      @message = Object.find(params[:id])
      if @message.destroy
        flash[:success] = 'Object was successfully deleted.'
        redirect_to messages_url
      else
        flash[:error] = 'Something went wrong'
        redirect_to messages_url
      end
    end

    def show
        message = Message.find(params[:id])
        render json: message
    end
  
    private
      def message_params
        params.require(:message).permit(:title, :content, images: [])
      end
  end