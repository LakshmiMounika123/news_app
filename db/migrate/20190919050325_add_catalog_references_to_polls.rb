class AddCatalogReferencesToPolls < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to(:polls, :catalog)
  end
end
