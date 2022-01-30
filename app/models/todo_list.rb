class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :delete_all
  belongs_to :category
  validates_presence_of :title

  acts_as_list

  def percent_complete
    return total_items if total_items.zero?

    (100 * completed_items.to_f / total_items).round(1)
  end

  def completed_items
    @completed_items ||= todo_items.completed.count
  end

  def total_items
    @todo_items ||= todo_items.count
  end

  def status
    case percent_complete.to_i
    when 0
      'A começar'
    when 100
      'Completo'
    else
      'Em progresso'
    end
  end

  def badge_color
    case percent_complete.to_i
    when 0
      'secondary'
    when 100
      'success'
    else
      'primary'
    end
  end
end
