class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :channel
      t.binary :image
      t.string :author
      t.timestamps
    end
    add_index :posts, :channel_id
  end
end
