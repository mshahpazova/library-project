class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :page_count, null: false
      t.string :genre, null: false
      t.string :attachment, null: false
      t.timestamps null: false
    end
  end
end
