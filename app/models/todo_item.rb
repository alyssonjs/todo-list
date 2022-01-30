class TodoItem < ApplicationRecord
  belongs_to :todo_list

  acts_as_list

  validates_presence_of :description

  scope :completed, -> { where(completed: true) }
end
