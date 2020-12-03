# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'association' do
    it { should belong_to(:account) }
  end

  context 'validation' do
    it { should validate_presence_of(:first_name) }
  end

  context 'factory' do
    let!(:account) { create(:account) }

    it 'should be valid' do
      expect(build(:profile, account_id: account.id)).to be_valid
    end
  end
end
