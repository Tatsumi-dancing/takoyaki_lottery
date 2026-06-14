class AddOrderDetailsToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :items_text, :string
    add_column :orders, :total_price, :integer
  end
end
