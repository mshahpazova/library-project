class CreatePoems < ActiveRecord::Migration[5.0]
  def change
    create_table :poems do |t|
      t.string :title
      t.text :content
      t.references :page, foreign_key: true
    end
  end
end
