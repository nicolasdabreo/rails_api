# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :account

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :gender
  validates_presence_of :rating
  validates_presence_of :telephone
end
