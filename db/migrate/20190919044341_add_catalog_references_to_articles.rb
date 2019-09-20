class AddCatalogReferencesToArticles < ActiveRecord::Migration[6.0]
  def change
    
    add_belongs_to(:articles, :catalog)

  end
end
