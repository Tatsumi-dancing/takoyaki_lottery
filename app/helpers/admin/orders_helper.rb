module Admin::OrdersHelper
    def next_status_label(order)
  if order.waiting?
    "受取可能にする"
  elsif order.ready?
    "受取済みにする"
  else
    "完了"
  end
end
end