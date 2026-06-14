class Order < ApplicationRecord
  enum status: {
  waiting: 0,
  ready: 1,
  completed: 2
}

  before_create :assign_number

  has_many :lottery_tickets

  private

  def assign_number
    last_number = Order.maximum(:number) || 0
    self.number = last_number + 1
  end
end