class AccountsController < ApplicationController
    def create
        user = User.find(params[:user])
        account = Account.new(balance: params[:balance], user: user)
        account.save
    end
end
