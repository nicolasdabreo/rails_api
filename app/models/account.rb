# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :profile, dependent: :destroy

  validates_presence_of :email
end
