require 'rails_helper'

RSpec.describe TodoItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'categories/1/todo_lists/1/todo_items').to route_to('todo_items#index', category_id: '1',
                                                                                          todo_list_id: '1')
    end

    it 'routes to #new' do
      expect(get: 'categories/1/todo_lists/1/todo_items/new').to route_to('todo_items#new', category_id: '1',
                                                                                            todo_list_id: '1')
    end

    it 'routes to #show' do
      expect(get: 'categories/1/todo_lists/1/todo_items/1').to route_to('todo_items#show', category_id: '1',
                                                                                           todo_list_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'categories/1/todo_lists/1/todo_items/1/edit').to route_to('todo_items#edit', category_id: '1',
                                                                                                todo_list_id: '1',
                                                                                                id: '1')
    end

    it 'routes to #create' do
      expect(post: 'categories/1/todo_lists/1/todo_items').to route_to('todo_items#create', category_id: '1',
                                                                                            todo_list_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'categories/1/todo_lists/1/todo_items/1').to route_to('todo_items#update', category_id: '1',
                                                                                             todo_list_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'categories/1/todo_lists/1/todo_items/1').to route_to('todo_items#update', category_id: '1',
                                                                                               todo_list_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'categories/1/todo_lists/1/todo_items/1').to route_to('todo_items#destroy', category_id: '1',
                                                                                                 todo_list_id: '1',
                                                                                                 id: '1')
    end
  end
end
