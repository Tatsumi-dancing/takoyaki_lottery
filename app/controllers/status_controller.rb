class StatusController < ApplicationController
  def index
    @waiting_orders = Order.waiting.order(:number)
    @ready_orders = Order.ready.order(:number)
  end
end