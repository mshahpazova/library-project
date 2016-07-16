#
class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      # set_primary_key 'feature_id'
      t.string :path
      t.references :page, foreign_key: true
    end
  end
end
