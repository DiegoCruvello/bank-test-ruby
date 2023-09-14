class UsersController < ApplicationController

  def index
    render json: {data: build_for_exibe}
  end

  def create
    begin
      user = User.new(users_params)
      if user.save
        return render json: {status: "success", message: "User was created successfully!"}, status: :created
      end
      render json: user.errors, status: :unprocessable_entity

    rescue ActiveRecord::RecordNotUnique => e
      return render json: {message: 'User conflict'}, status: 409
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password_digest)
  end

  def build_for_exibe
    @user_to_response = []
    @users = User.all
    @users.each do |u|
      user_to_response = {
        "id": u.id,
        "name": u.name,
        "email": u.email,
        "accounts": u.accounts
      }
      @user_to_response << user_to_response
    end
    return @user_to_response
  end

end
