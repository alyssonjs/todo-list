class TodoListsController < ApplicationController
  before_action :set_category
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  # GET categories/1/todo_lists
  def index
    @todo_lists = @category.todo_lists
  end

  # GET categories/1/todo_lists/1
  def show
    @todo_item = TodoItem.new
  end

  # GET categories/1/todo_lists/new
  def new
    @todo_list = @category.todo_lists.build
  end

  # GET categories/1/todo_lists/1/edit
  def edit
  end

  # POST categories/1/todo_lists
  def create
    @todo_list = @category.todo_lists.build(todo_list_params)


    if @todo_list.save
      redirect_to user_categories_path(@category.user)
    else
      render action: 'new'
    end
  end

  # PUT categories/1/todo_lists/1
  def update
    if @todo_list.update_attributes(todo_list_params)
      redirect_to([@todo_list.category, @todo_list], notice: 'Todo list was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE categories/1/todo_lists/1
  def destroy
    @todo_list.destroy

    redirect_to category_todo_lists_url(@category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_todo_list
      @todo_list = @category.todo_lists.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_list_params
      params.require(:todo_list).permit(:category_id, :title, :description, :position, :user_id)
    end
end
