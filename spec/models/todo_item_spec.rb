require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:todo_list) }
  end
end
