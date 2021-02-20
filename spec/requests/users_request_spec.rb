require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { build(:user) }

  describe 'user requests' do
    it 'returns http success from root path' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success from users path' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'returns http found from create user path' do
      post '/users', params: { user: { email: user.email } }
      expect(response).to have_http_status(:found)
    end
  end
end
