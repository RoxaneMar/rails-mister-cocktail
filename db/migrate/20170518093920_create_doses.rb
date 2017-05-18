class CreateDoses < ActiveRecord::Migration[5.0]
  def change
    create_table :doses do |t|
      t.text :description
      t.belongs_to :ingredient
      t.belongs_to :cocktail

      t.timestamps
    end
  end
end
