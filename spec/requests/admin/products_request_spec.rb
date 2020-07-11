require 'rails_helper'

RSpec.describe "Admin::Products", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/admin/products/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admin/products/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/admin/products/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/products/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
