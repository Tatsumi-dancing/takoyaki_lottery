class LotteryController < ApplicationController
  def index
  end

  def show
    @ticket = LotteryTicket.find_by!(
      token: params[:token]
    )
  end

  def draw
    ticket = LotteryTicket.find_by!(
      token: params[:token]
    )

    if ticket.prize.blank?
      ticket.update!(
        prize: LotteryService.draw
      )
    end

    render json: {
      prize: ticket.prize
    }
  end
end