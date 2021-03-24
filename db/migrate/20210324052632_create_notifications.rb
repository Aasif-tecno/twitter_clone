class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient, null: false
      t.integer :actor, null: false
      t.references :message, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true
      t.boolean    :read, default: false
      t.timestamps
    end
  end
end
