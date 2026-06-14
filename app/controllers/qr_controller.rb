class QrController < ApplicationController
  def index
    @order = Order
      .joins(:lottery_tickets)
      .distinct
      .order(number: :desc)
      .first
    @lottery_base_url = lottery_base_url
  end

  def show
    @order = Order.find(params[:id])
    @lottery_base_url = lottery_base_url
  end

  private

  def lottery_base_url
    ENV["LOTTERY_BASE_URL"].presence || default_lottery_base_url
  end

  def default_lottery_base_url
    return request.base_url unless Rails.env.development?

    "#{request.protocol}#{local_network_ip}:#{request.port}"
  end

  def local_network_ip
    Socket.ip_address_list.find { |addr| addr.ipv4_private? && !addr.ipv4_loopback? }&.ip_address || request.host
  end
end
