class CreatePostTags < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tags do |t|
      t.references :post, foreign_key: { on_delete: :cascade }
      t.references :tag, foreign_key: { on_delete: :cascade }
    end
  end
end
