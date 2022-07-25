class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.text :title
      t.string :description
      t.boolean :isLiked, :default false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
