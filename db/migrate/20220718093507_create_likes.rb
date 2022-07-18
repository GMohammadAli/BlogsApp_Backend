class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :no_of_likes
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
