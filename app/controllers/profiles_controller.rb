# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_account
  before_action :set_profile, only: %i[show update]

  def show
    json_response(@profile)
  end

  def create
    @profile = Profile.create!(profile_params.merge({ account_id: @account.id }))
    json_response(@account.profile, 201)
  end

  def update
    @profile.update!(profile_params)
    json_response(@profile, 200)
  end

  private

  PROFILE_PARAMS = %i[first_name last_name gender rating telephone].freeze
  def profile_params
    params.permit(PROFILE_PARAMS)
  end

  def set_account
    @account = Account.find(params[:account_id])
  end

  def set_profile
    @profile = Profile.find_by!(account: params[:account_id]) if @account
  end
end
