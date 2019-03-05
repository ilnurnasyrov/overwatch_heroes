class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    # Small hack to drop auto increment
    create_table :abilities, primary_key: :id, id: false do |t|
      t.integer :id, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :is_ultimate, null: false
      t.integer :hero_id, null: false

      t.timestamps
    end

    add_index :abilities, :id, unique: true
  end
end
