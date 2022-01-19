class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      user = User.new(user_params)
      if user.save
        render json: {data: { type: 'users', id: user.id, attributes: { email: user_params[:email], api_key: user_params[:api_key]}}}, status: 201
      else
        render json: {error: 'Email already exists'}
      end
    else
      render json: {error: 'Passwords do not match'}
    end
  end

  private
  def user_params
    params[:api_key] = SecureRandom.base64.tr('+/=', 'Qrt')
    params.permit(:email, :password, :api_key)
  end
end