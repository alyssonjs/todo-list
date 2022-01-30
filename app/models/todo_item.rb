class TodoItem < ApplicationRecord
  belongs_to :todo_list

  acts_as_list

  scope :completed, -> { where(completed: true) }
end
