class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
