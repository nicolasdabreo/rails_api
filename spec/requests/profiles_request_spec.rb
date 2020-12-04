# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let!(:account) { create(:account) }

  describe 'GET /accounts/:account_id/profile' do
    let!(:profile) { create(:profile, account_id: account.id) }

    before { get "/accounts/#{account.id}/profiles" }

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns the profile' do
      expect(json_response).to_not be_empty
      expect(json_response['id']).to eq(profile.id)
    end
  end

  describe 'POST /accounts/:account_id/profile' do
    let(:params) { valid_params }

    before { post "/accounts/#{account.id}/profiles", params: params }

    it 'returns 201' do
      expect(response).to have_http_status(201)
    end

    it 'returns the profile' do
      expect(json_response['first_name']).to eq(params[:first_name])
    end
  end

  describe 'PUT /accounts/:account_id/profile' do
    let!(:profile) { create(:profile, account_id: account.id) }
    let(:params) { valid_params.merge!(email: Faker::Internet.email) }

    before { put "/accounts/#{account.id}/profiles", params: params }

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns the updated profile' do
      expect(json_response).not_to be_empty
      expect(json_response['account_id']).to eq(account.id)
      expect(json_response['first_name']).to eq(params[:first_name])
    end
  end

  private

  def valid_params
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      gender: Faker::Gender.type,
      nickname: Faker::Superhero.name,
      bio: Faker::Lorem.sentence,
      telephone: Faker::PhoneNumber.phone_number
    }
  end

  def invalid_params
    valid_params.merge!(email: '')
  end
end
