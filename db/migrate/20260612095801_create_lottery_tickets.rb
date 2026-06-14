class CreateLotteryTickets < ActiveRecord::Migration[7.2]
  def change
    create_table :lottery_tickets do |t|
      t.string :token
      t.string :prize

      t.timestamps
    end
  end
end
