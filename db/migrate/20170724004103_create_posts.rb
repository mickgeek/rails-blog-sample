class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :slug
      t.text :body
      t.text :snippet
      t.integer :status, limit: 2
      t.timestamp :published_date

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
