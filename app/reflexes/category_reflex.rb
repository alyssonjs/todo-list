# frozen_string_literal: true

class CategoryReflex < ApplicationReflex
  def change_category
    @category = Category.find element.dataset.id
  end

  def set_create_category
    @category = Category.find(element.dataset.id) if element.dataset.id
    @create_category = true
  end

  def set_edit_category
    @category = Category.find(element.dataset.id) if element.dataset.id
    @editing_category = @category.id
  end

  def edit_category
    @category = Category.find(element.dataset.id)
    @category.assign_attributes(category_params)
    @category.save
    @editing_category = nil
  end

  def delete_category
    category = Category.find element.dataset.id
    category.todo_lists.each { |todo_list| todo_list.todo_items.delete_all }
    category.todo_lists.delete_all

    category.delete
  end

  def unset_create_category
    @category = Category.find(element.dataset.id)
    @create_category = false
  end

  def submit
    category = User.find(element.dataset.id).categories.new
    category&.assign_attributes(category_params)
    category.save
  end

  def create_category
    category = User.find(element.dataset.id).categories.new
    category.assign_attributes(category_params)
    category.save
    @create_category = false
  end

  def sort(sgid, new_position)
    category = GlobalID::Locator.locate_signed(sgid)
    category.update(position: new_position)
    @category = category
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
