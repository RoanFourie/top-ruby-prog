
def stock_picker(stock_prices)
    result = []
    day_buy = 0
    day_sell = 0
    largest_profit = 0
    profit = 0
    (0..(stock_prices.length-2)).each do |a| # buy (skip last day)
        (1..(stock_prices.length-1)).each do |b| # sell (skip first day)
            if a < b # You cannot sell before you buy
                profit = stock_prices[b] - stock_prices[a]
                if profit > largest_profit
                    largest_profit = profit
                    day_buy = a
                    day_sell = b
                end
            end
        end
    end
    result = [day_buy, day_sell]
    return result
end

print(stock_picker([17,3,6,9,15,8,6,1,10]))
