# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :rating
      t.string :nickname
      t.text :bio
      t.integer :telephone
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
