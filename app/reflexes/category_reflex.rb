# frozen_string_literal: true

class CategoryReflex < ApplicationReflex

  def change_category
    @category = Category.find element.dataset.id
  end

end
