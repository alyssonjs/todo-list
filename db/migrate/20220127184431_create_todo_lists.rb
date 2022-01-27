class CreateTodoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_lists do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.integer :position

      t.timestamps
    end
  end
end
