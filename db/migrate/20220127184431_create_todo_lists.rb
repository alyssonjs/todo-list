class CreateTodoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_lists do |t|
      t.references :category, null: false, foreign_key: true,  on_delete: :cascade
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
