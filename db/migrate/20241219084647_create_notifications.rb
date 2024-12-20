class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.references :actor, null: false, foreign_key: { to_table: :users }
      t.string :action
      t.references :notifiable, polymorphic: true
      t.boolean :read, default: false
      
      t.timestamps
    end
    
    add_index :notifications, [:recipient_id, :read]
  end
end
