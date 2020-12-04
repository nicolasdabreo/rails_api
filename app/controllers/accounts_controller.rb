# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_account, only: %i[show update destroy]

  def index
    @accounts = Account.all
    json_response(@accounts)
  end

  def show
    json_response(@account)
  end

  def create
    @account = Account.create!(account_params)
    json_response(@account, 201)
  end

  def update
    @account.update!(account_params)
    json_response(@account)
  end

  def destroy
    @account.destroy
    head 204
  end

  private

  ACCOUNT_PARAMS = %i[email].freeze
  def account_params
    params.permit(ACCOUNT_PARAMS)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
