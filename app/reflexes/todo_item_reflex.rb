# frozen_string_literal: true

class TodoItemReflex < ApplicationReflex
  def delete_todo_item
    todo_item = TodoItem.find element.dataset.id
    todo_item.destroy
    @category = todo_item.todo_list.category
    @todo_list = todo_item.todo_list
  end

  def submit
    @todo_item = TodoList.find(element.dataset.id).todo_items.new
    @todo_item&.assign_attributes(todo_item_params)
    @todo_item.save
  end

  def create_todo_item
    @todo_item = TodoList.find(element.dataset.id).todo_items.new
    @todo_item&.assign_attributes(todo_item_params)
    @todo_item.save
    @category = @todo_item.todo_list.category
  end

  def mark_complete
    todo_item = TodoItem.find(element.dataset.id)
    todo_item.update(completed: true, completed_at: Time.now)
    @category = todo_item.todo_list.category
  end

  def mark_incomplete
    todo_item = TodoItem.find(element.dataset.id)
    todo_item.update(completed: false, completed_at: nil)
    @category = todo_item.todo_list.category
  end

  def sort(sgid, new_position)
    todo_item = GlobalID::Locator.locate_signed(sgid)
    todo_item.update(position: new_position)
    @category = todo_item.todo_list.category
  end

  private

  def todo_item_params
    params.require(:todo_item).permit(:description)
  end
end
