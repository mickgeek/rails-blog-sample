class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
    end
    add_index :tags, :name, unique: true
    add_index :tags, :slug, unique: true
  end
end
