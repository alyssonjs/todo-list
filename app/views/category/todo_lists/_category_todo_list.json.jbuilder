json.extract! category_todo_list, :id, :category_id, :title, :description, :position, :created_at, :updated_at
json.url category_todo_list_url(category_todo_list, format: :json)
