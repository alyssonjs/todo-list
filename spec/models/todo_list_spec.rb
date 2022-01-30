require 'rails_helper'

RSpec.describe TodoList, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, user: user) }
  let!(:todo_list) { FactoryBot.create(:todo_list, category: category) }
  let!(:todo_items) { FactoryBot.create_list(:todo_item, 5, todo_list: todo_list) }

  before do
    @total_completed_items = todo_items.select { |item| item.completed == true }.count
    @incomplete_todo_items = todo_items.select { |item| item.completed == false }.count
    @total_items = @total_completed_items + @incomplete_todo_items
    @total_percentage = (100 * @total_completed_items.to_f / @total_items).round(1)
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:todo_items) }
  end

  it 'returns todo_items completed percentage for this todo list' do
    expect(todo_list.percent_complete).to eq(@total_percentage)
  end

  it 'returns todo_items completed for this todo list' do
    expect(todo_list.completed_items).to eq(@total_completed_items)
  end

  it 'returns this todo list total items quantity' do
    expect(todo_list.total_items).to eq(@total_items)
  end
end
