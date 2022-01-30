require 'rails_helper'

RSpec.describe TodoListsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'categories/1/todo_lists').to route_to('todo_lists#index', category_id: '1')
    end

    it 'routes to #new' do
      expect(get: 'categories/1/todo_lists/new').to route_to('todo_lists#new', category_id: '1')
    end

    it 'routes to #show' do
      expect(get: 'categories/1/todo_lists/1').to route_to('todo_lists#show', category_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'categories/1/todo_lists/1/edit').to route_to('todo_lists#edit', category_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'categories/1/todo_lists').to route_to('todo_lists#create', category_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'categories/1/todo_lists/1').to route_to('todo_lists#update', category_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'categories/1/todo_lists/1').to route_to('todo_lists#update', category_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'categories/1/todo_lists/1').to route_to('todo_lists#destroy', category_id: '1', id: '1')
    end
  end
end
