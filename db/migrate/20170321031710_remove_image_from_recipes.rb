class RemoveImageFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :image
  end
end
