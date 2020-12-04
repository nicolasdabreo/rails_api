# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'association' do
    it { should have_one(:profile).dependent(:destroy) }
  end

  context 'validation' do
    it { should validate_presence_of(:email) }
  end

  context 'factory' do
    let!(:account) { build(:account) }

    it 'is valid' do
      expect(account).to be_valid
    end
  end
end
