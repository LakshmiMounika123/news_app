class CreateThumbnails < ActiveRecord::Migration[6.0]
  def change
    create_table :thumbnails do |t|
      t.string :url
      t.references :thumbnailable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
