class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name,             null: false
      t.integer :price,           null: false
      t.text :description,        null: false
      t.integer :genre_id,        null: false
      t.integer :drink_id,        null: false
      t.integer :scene_id,        null: false
      t.integer :allergy_id,      null: false
      t.integer :day_id,          null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
