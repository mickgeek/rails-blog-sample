class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :url
      t.string :title
      t.text :body

      t.timestamps
    end
    add_index :pages, :url, unique: true
  end
end
