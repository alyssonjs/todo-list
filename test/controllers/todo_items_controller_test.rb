require 'test_helper'

class TodoItemsControllerTest < ActionController::TestCase
  setup do
    @todo_list = todo_lists(:one)
    @todo_item = todo_items(:one)
  end

  test "should get index" do
    get :index, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should create todo_item" do
    assert_difference('TodoItem.count') do
      post :create, params: { todo_list_id: @todo_list, todo_item: @todo_item.attributes }
    end

    assert_redirected_to todo_list_todo_item_path(@todo_list, TodoItem.last)
  end

  test "should show todo_item" do
    get :show, params: { todo_list_id: @todo_list, id: @todo_item }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { todo_list_id: @todo_list, id: @todo_item }
    assert_response :success
  end

  test "should update todo_item" do
    put :update, params: { todo_list_id: @todo_list, id: @todo_item, todo_item: @todo_item.attributes }
    assert_redirected_to todo_list_todo_item_path(@todo_list, TodoItem.last)
  end

  test "should destroy todo_item" do
    assert_difference('TodoItem.count', -1) do
      delete :destroy, params: { todo_list_id: @todo_list, id: @todo_item }
    end

    assert_redirected_to todo_list_todo_items_path(@todo_list)
  end
end
