class MessagesController < ApplicationController
  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_param)

		if @message.valid?
			ContactForm.new_message(@message).deliver_now
			flash[:success] = "Thank you for contacting me! I'll get back to you within 24-48 hours."
			redirect_to contact_url 
		else
			render 'new'

		end
	end


	private
		def message_param
			params.require(:message).permit(:name, :email, :body, :subject)
		end
	end

