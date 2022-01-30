class CategoriesController < ApplicationController
  before_action :set_user
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access, except: [:index]

  # GET users/1/categories
  def index
    @categories = @user.categories
  end

  # GET users/1/categories/1
  def show
  end

  # GET users/1/categories/new
  def new
    @category = @user.categories.build
  end

  # GET users/1/categories/1/edit
  def edit
  end

  # POST users/1/categories
  def create
    @category = @user.categories.build(category_params)

    if @category.save
      redirect_to([@category.user, @category], notice: 'Category was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/categories/1
  def update
    if @category.update_attributes(category_params)
      redirect_to([@category.user, @category], notice: 'Category was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/categories/1
  def destroy
    @category.destroy

    redirect_to user_categories_url(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if current_user
        @user = User.find(current_user.id)
      else
        flash[:notice] = 'Precisa estar logado'
        redirect_to login_path
      end
    end

    def set_category
      @category = @user.categories.find(params[:id])
    end

    def authorize_access
      return if @user.id == current_user.id

      flash[:notice] = 'Acesso negado'
      redirect_to login_path
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:user_id, :name, :position)
    end
end
