class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user.authenticate(params[:password])
      render json: { data: { type: 'users', id: user.id, attributes: { email: user.email, api_key: user.api_key } } },
             status: 200
    else
      render json: { error: 'Username or password do not match' }
    end
  end
end
