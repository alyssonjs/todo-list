# frozen_string_literal: true

class TodoListReflex < ApplicationReflex

  def delete_todo_list
    todo_list = TodoList.find element.dataset.id
    todo_list.destroy
  end

end
