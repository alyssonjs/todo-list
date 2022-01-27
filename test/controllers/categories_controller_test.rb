require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @category = categories(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, params: { user_id: @user, category: @category.attributes }
    end

    assert_redirected_to user_category_path(@user, Category.last)
  end

  test "should show category" do
    get :show, params: { user_id: @user, id: @category }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @category }
    assert_response :success
  end

  test "should update category" do
    put :update, params: { user_id: @user, id: @category, category: @category.attributes }
    assert_redirected_to user_category_path(@user, Category.last)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, params: { user_id: @user, id: @category }
    end

    assert_redirected_to user_categories_path(@user)
  end
end
