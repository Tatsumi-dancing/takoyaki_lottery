class LotteryService
  def self.draw
    r = rand(100)

    return "トッピング無料" if r < 40
    return "+1個" if r < 75
    return "+2個" if r < 90
    return "ドリンク無料" if r < 98

    "1パック無料"
  end
end