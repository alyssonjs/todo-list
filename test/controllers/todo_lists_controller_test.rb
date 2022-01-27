require 'test_helper'

class TodoListsControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @todo_list = todo_lists(:one)
  end

  test "should get index" do
    get :index, params: { category_id: @category }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { category_id: @category }
    assert_response :success
  end

  test "should create todo_list" do
    assert_difference('TodoList.count') do
      post :create, params: { category_id: @category, todo_list: @todo_list.attributes }
    end

    assert_redirected_to category_todo_list_path(@category, TodoList.last)
  end

  test "should show todo_list" do
    get :show, params: { category_id: @category, id: @todo_list }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { category_id: @category, id: @todo_list }
    assert_response :success
  end

  test "should update todo_list" do
    put :update, params: { category_id: @category, id: @todo_list, todo_list: @todo_list.attributes }
    assert_redirected_to category_todo_list_path(@category, TodoList.last)
  end

  test "should destroy todo_list" do
    assert_difference('TodoList.count', -1) do
      delete :destroy, params: { category_id: @category, id: @todo_list }
    end

    assert_redirected_to category_todo_lists_path(@category)
  end
end
