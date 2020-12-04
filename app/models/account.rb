# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :profile, dependent: :destroy

  validates :email, format: { with: /(.+)@(.+)/, message: 'invalid' },
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 4, maximum: 254 }

  validates_presence_of :email
end
