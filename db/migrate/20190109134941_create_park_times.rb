# frozen_string_literal: true

class CreateParkTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :park_times do |t|
      t.string :code, null: false
      t.boolean :processed, default: false
      t.float :cost_per_min
      t.belongs_to :vehicle, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
