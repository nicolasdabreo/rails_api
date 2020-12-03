# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :email
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
