require 'rails_helper'

describe 'user routes' do
  it 'routes GET root to the index action' do
    expect(get '/').to route_to('users#index')
  end

  it 'routes GET users to the index action' do
    expect(get '/users').to route_to('users#index')
  end

  it 'routes POST users to the create action' do
    expect(post '/users').to route_to('users#create')
  end
end