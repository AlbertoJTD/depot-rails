require 'rails_helper'

RSpec.describe 'Stores', type: :request do
  let(:user) { create(:user) }

  before do
    # Log in as the created user
    post login_url, params: { name: user.name, password: 'secret123' }
    follow_redirect! if response.redirect?
  end

  describe 'GET /stores' do
    it 'returns a success response' do
      get store_index_url
      expect(response).to be_successful
    end
  end
end
