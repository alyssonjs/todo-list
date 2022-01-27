json.extract! todo_list_todo_item, :id, :todo_list_id, :name, :description, :position, :completed, :completed_at, :created_at, :updated_at
json.url todo_list_todo_item_url(todo_list_todo_item, format: :json)
