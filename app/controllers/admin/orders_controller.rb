class Admin::OrdersController < ApplicationController
  def index
  @orders = Order
    .where.not(status: :completed)
    .order(number: :asc)
end

  def create
  order = Order.create!(status: :waiting)

  LotteryTicket.create!(
    order: order,
    token: SecureRandom.urlsafe_base64(16),
    prize: LotteryService.draw
  )

  redirect_to admin_orders_path
end

  def update
    order = Order.find(params[:id])

    if order.waiting?
  order.ready!
elsif order.ready?
  order.completed!
end

    redirect_to admin_orders_path
  end
end