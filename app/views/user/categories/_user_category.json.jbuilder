json.extract! user_category, :id, :user_id, :name, :position, :created_at, :updated_at
json.url user_category_url(user_category, format: :json)
