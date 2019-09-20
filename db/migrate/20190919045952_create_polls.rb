class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.string :description
      t.integer :status,default: :created

      t.timestamps
    end
  end
end
