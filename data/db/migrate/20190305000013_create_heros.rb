class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    # Small hack to drop auto increment
    create_table :heros, primary_key: :id, id: false do |t|
      t.integer :id, null: false
      t.string :name, null: false
      t.string :real_name, null: false
      t.integer :health, null: false
      t.integer :armour, null: false
      t.integer :shield, null: false

      t.timestamps
    end

    add_index :heros, :id, unique: true
  end
end
