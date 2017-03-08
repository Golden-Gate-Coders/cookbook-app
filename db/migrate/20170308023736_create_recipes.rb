class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredients
      t.integer :prep_time
      t.string :directions
      t.string :image
      t.string :chef

      t.timestamps
    end
  end
end
