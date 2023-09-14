class TransactionsController < ApplicationController
    def index
        render json: {data: 'teste'}
    end
    
    def create
        sender = User.find(params[:sender_account])
        recipient = User.find(params[:recipient_account])
      
        sender_account = sender.accounts.first
        recipient_account = recipient.accounts.first
      
        sender_account.balance -= params[:balance]
        recipient_account.balance += params[:balance]
      
        sender_account.save
        recipient_account.save
      
        render json: { sender: sender_account.balance, recipient: recipient_account.balance }
      end
end
