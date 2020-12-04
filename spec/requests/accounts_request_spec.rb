# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Accounts', type: :request do
  let!(:accounts) { create_list(:account, 10) }
  let(:account_id) { accounts.first.id }

  describe 'GET /accounts' do
    before { get '/accounts' }

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns accounts' do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(10)
    end
  end

  describe 'GET /accounts/:id' do
    before { get "/accounts/#{account_id}" }

    context 'when the record exists' do
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the account' do
        expect(json_response).not_to be_empty
        expect(json_response['id']).to eq(account_id)
      end
    end

    context 'when the record does not exist' do
      let(:account_id) { 99_999_999 }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Account/)
      end
    end
  end

  describe 'POST /accounts' do
    context 'when the request is valid' do
      let(:params) { valid_params }
      before { post '/accounts', params: params }

      it 'returns 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns the account' do
        expect(json_response).not_to be_empty
        expect(json_response['email']).to eq(params[:email])
      end
    end

    context 'when the request is invalid' do
      before { post '/accounts', params: invalid_params }

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Email invalid/)
      end
    end
  end

  describe 'PUT /accounts/:id' do
    context 'when the record exists' do
      let(:params) { valid_params }
      before { put "/accounts/#{account_id}", params: params }

      context 'and the request is valid' do
        it 'returns 200' do
          expect(response).to have_http_status(200)
        end

        it 'returns the account' do
          expect(json_response).not_to be_empty
          expect(json_response['id']).to eq(account_id)
        end
      end

      context 'and the request is invalid' do
        let(:params) { invalid_params }

        it 'returns 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Validation failed: Email invalid/)
        end
      end
    end
  end

  describe 'DELETE /accounts/:id' do
    before { delete "/accounts/#{account_id}" }

    it 'returns 204' do
      expect(response).to have_http_status(204)
    end
  end

  private

  def valid_params
    {
      email: Faker::Internet.email
    }
  end

  def invalid_params
    {
      email: 'invalid'
    }
  end
end
