def stock_picker(prices)
  best_revenue = [0, 1]
  prices.each_with_index do |buy, index_buy|
    prices.each_with_index do |sell, index_sell|
      next if index_buy >= index_sell

      if (prices[best_revenue.last] - prices[best_revenue.first]) < (sell - buy)
        best_revenue[0] = index_buy
        best_revenue[1] = index_sell
      end
    end
  end
  best_revenue
end

prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
best = stock_picker(prices)
puts "Best day to buy is: #{best[0]}, at #{prices[best[0]]}$" #=> Best day to buy is: 1, at 3$
puts "Best day to sell is: #{best[1]}, at #{prices[best[1]]}$" #=> Best day to sell is: 4, at 15$
puts "Total profit is: #{prices[best[1]] - prices[best[0]]}$" #=> Total profit is: 12$
