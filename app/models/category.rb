class Category < ApplicationRecord
  has_many :todo_lists, dependent: :destroy
  belongs_to :user
  acts_as_list
end
