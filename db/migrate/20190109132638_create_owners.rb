# frozen_string_literal: true

class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :document
      t.integer :document_type

      t.timestamps
    end
  end
end
