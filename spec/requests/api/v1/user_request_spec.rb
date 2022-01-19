require 'rails_helper'

RSpec.describe 'weather requests' do
  it 'can return a forecast', :vcr do
    headers = { 'Content-Type' => 'application/json' }
    user_params = { email: 'test@test.com', password: 'testpassword',
                    password_confirmation: 'testpassword' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to have_http_status(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:attributes][:email]).to eq('test@test.com')
    expect(user[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns an error if email already exists' do
    user = User.create!({ email: 'test@test.com', password: 'password',
                          api_key: 'MWbKEvRjZhEfPUu8HM1sPwtt' })

    headers = { 'Content-Type' => 'application/json' }
    user_params = { email: 'test@test.com', password: 'testpassword',
                    password_confirmation: 'testpassword' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to have_http_status(401)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq('Email already exists')
  end

  it 'returns an error if passwords dont match' do
    headers = { 'Content-Type' => 'application/json' }
    user_params = { email: 'test@test.com', password: 'testpassword',
                    password_confirmation: 'something else' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to have_http_status(401)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq('Passwords do not match')
  end
end
