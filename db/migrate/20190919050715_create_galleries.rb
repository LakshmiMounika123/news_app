class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.string :title, null: false
      t.string :description
      t.integer :status, default: :created
      t.datetime :published_at
      t.references :catalog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
