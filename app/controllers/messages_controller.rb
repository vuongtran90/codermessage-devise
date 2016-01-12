class MessagesController < ApplicationController
	before_action :authenticate_user!

	def new
		@message = Message.new
		@user = current_user
		@recipients = User.all
	end

	def create
		@message = current_user.messages.build(message_params)

		if @message.save
			flash[:success] = "Message Sent!"
			redirect_to root_path
		else
			flash[:alert] = "Fail!"
			render :new
		end
	end

	def index
		@messages = Recipient.where(:user_id => current_user.id).order("created_at DESC")
	end

	private

		def message_params
			params.require(:message).permit(:body, :sender_id, user_tokens: [])
		end
end
