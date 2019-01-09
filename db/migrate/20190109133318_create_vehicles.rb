# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.integer :kind
      t.string :identifier
      t.belongs_to :owner, foreign_key: { on_delete: :cascade }, index: true
      t.timestamps
    end
  end
end
