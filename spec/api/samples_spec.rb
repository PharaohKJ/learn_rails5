require 'rails_helper'

describe ApplicationApi do
  context "GET /api/v1/samples" do
    it "return empty array" do
      get '/api/v1/samples'
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq []
    end

    it "return samples" do
      Sample.create(name: 'for-test')
      get '/api/v1/samples'
      expect(response.status).to eq(200)
      expect(response.body).to eq Sample.limit(20).to_json
    end

    it "return a sample" do
      p = Sample.create(name: 'for-test')
      get "/api/v1/samples/#{p.id}"
      expect(response.status).to eq(200)
      expect(response.body).to eq Sample.find(p.id).to_json
    end
  end

  context "POST /api/v1/samples" do
    it 'create sample' do
      post '/api/v1/samples/', params: { name: 'sample' }
      expect(response.status).to eq(201)
      expect(Sample.first).not_to eq nil
    end
  end
end
