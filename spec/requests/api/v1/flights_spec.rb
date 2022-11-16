require 'swagger_helper'

RSpec.describe 'api/v1/flights', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/doctors'
      expect(response).to have_http_status(:success)
    end
  end
end
