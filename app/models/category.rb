class Category < ApplicationRecord
  has_many :todo_lists
  belongs_to :user
end
