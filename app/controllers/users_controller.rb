class UsersController < ApplicationController

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
end
