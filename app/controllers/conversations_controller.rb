class ConversationsController < ApplicationController
  before_action :authorised

  def new
    @userListMail ||= []

    User.all.each do |user|
      recepient = Receipent.new
      recepient.id = user.id.to_s + ",User"
      recepient.full_name = user.full_name
      recepient.type = "User"
      @userListMail << recepient
    end
    Student.all.each do |student|
      recepient = Receipent.new
      recepient.id = student.id.to_s + ",Student"
      recepient.full_name = student.full_name
      recepient.type = "Student"
      @userListMail << recepient
    end
    ##########
     # @users = User.all
     # @students = Student.all
     # @all_users = @users | @students
  end

  def create
    all_recipients = conversation_params[:recipients]
    all_recipients.each do |rec|

      if rec != ""
        rec = rec.split(',')
        if rec[1] == "Student"
          recipients = Student.where(id: rec[0])
          @conversation = @current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
        elsif rec[1] == "User"
          recipients = User.where(id: rec[0])
          @conversation = @current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
        end
      end
    end
  #   if student_signed_in?
  #   recipients = User.where(id: params[:id][:id])
  # elsif user_signed_in?
  #   # stud_reci = Student.where(id: conversation_params[:recipients])
  #   # user_reci = User.where(id: conversation_params[:recipients])
  #   # recipients = user_reci | stud_reci
  #   recipients = Student.where(id: params[:id][:id])
  # end
  # p "recipients"
  # p @recipients
  # p Student.all
    # conversation = @current_user.send_message(@recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(@current_user)
    conversation.mark_as_read(@current_user)
  end

  def reply
    @current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(@current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(@current_user)
    redirect_to mailbox_inbox_path
  end

  private

  def message_params
    params.require(:message).permit(:body, :subject)
  end

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end
end

class Receipent
  attr_accessor :full_name, :id, :type
end
