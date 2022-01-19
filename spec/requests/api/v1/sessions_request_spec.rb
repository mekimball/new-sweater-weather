require 'rails_helper'

RSpec.describe 'sessions' do
  before do
    headers = { 'Content-Type' => 'application/json'}
    user_params = { email: 'test@test.com', password: 'testpassword', password_confirmation: 'testpassword' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    @user = User.last
  end
  it 'can log a user in', :vcr do
    headers = { 'Content-Type' => 'application/json'}
    params = { email: 'test@test.com', password: 'testpassword'}
    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

    expect(response).to have_http_status(200)

    session = JSON.parse(response.body, symbolize_names: true)

    expect(session).to have_key(:data)
    expect(session[:data]).to have_key(:id)
    expect(session[:data][:attributes]).to have_key(:api_key)
    expect(session[:data][:attributes][:email]).to eq('test@test.com')

  end
end