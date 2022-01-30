# frozen_string_literal: true

class TodoListReflex < ApplicationReflex
  def delete_todo_list
    todo_list = TodoList.find element.dataset.id
    todo_list.destroy
    @category = todo_list.category
  end

  def submit
    @todo_list = Category.find(element.dataset.id).todo_lists.new
    @todo_list&.assign_attributes(todo_list_params)
    @todo_list.save
  end

  def set_edit_todo_list
    @todo_list = TodoList.find(element.dataset.id)
    @category = @todo_list.category
    @editing_todo_list = @todo_list.id
  end

  def edit_todo_list
    @todo_list = TodoList.find(element.dataset.id)
    @todo_list.assign_attributes(todo_list_params)
    @todo_list.save
    @category = @todo_list.category
    @editing_todo_list = nil
  end

  def create_todo_list
    @todo_list = Category.find(element.dataset.id).todo_lists.new
    @todo_list&.assign_attributes(todo_list_params)
    @todo_list.save
    @category = @todo_list.category
  end

  def selected_list
    @category = TodoList.find(element.dataset.id).category
    @selected_list = element.dataset.id
  end

  def sort(sgid, new_position)
    todo_list = GlobalID::Locator.locate_signed(sgid)
    todo_list.update(position: new_position)
    @category = todo_list.category
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
