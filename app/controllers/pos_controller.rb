class PosController < ApplicationController
  def index
  end

  def create
  cart = JSON.parse(params[:cart_json] || "[]")

  items_text = cart.map { |item| item["name"] }.join("、")
  total_price = params[:total_price].to_i

  ticket_count = cart.count { |item| item["name"].include?("たこ焼きセット") }

  order = Order.create!(
    status: :waiting,
    items_text: items_text,
    total_price: total_price
  )

  ticket_count.times do
  LotteryTicket.create!(
    order: order,
    token: SecureRandom.urlsafe_base64(16),
    prize: LotteryService.draw
  )
end

  redirect_to pos_path, notice: "注文を作成しました"
end
end