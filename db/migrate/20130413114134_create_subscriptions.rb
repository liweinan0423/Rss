class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :username
      t.references :channel

      t.timestamps
    end
    add_index :subscriptions, :channel_id
  end
end
