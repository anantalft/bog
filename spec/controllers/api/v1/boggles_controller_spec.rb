require 'rails_helper'
require 'pry'
RSpec.describe Api::V1::BogglesController do

  describe "GET #index" do
    before do
      get :index, format: :json
    end

    it 'return http sucess' do
      expect(response).to have_http_status(:success)
    end

    it "always returns valid words greater than 1 " do
      expect(assigns(:v_words).length).to be >1
    end
  end
end
