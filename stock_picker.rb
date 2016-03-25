def stock_picker(prices)
    if prices.index(prices.max) > prices.index(prices.min)
        # If the max price day comes after the min price day, just choose those
        day_to_buy = prices.index(prices.min)
        day_to_sell = prices.index(prices.max)
        profit = prices.max - prices.min

        puts "Buy on Day #{day_to_buy} and sell on Day #{day_to_sell} for a profit of $#{profit}!"
    elsif prices == prices.sort.reverse
        # If prices only fall and there is no opportunity to sell for higher than bought
        puts "You'll lose money no matter when you buy. Stay home this week."
    else
        # All other cases
        profit = 0

        prices.each_with_index do |price, index|
            if index + 1 == prices.length
                #Do nothing for the last entry to avoid an error
            elsif prices[(index+1)..-1].max - price > profit
                # Check if the potential profit for buying on each day is the greatest
                # potential profit so far
                day_to_buy = index
                day_to_sell = prices.index(prices[index+1..-1].max)
                profit = prices[(index+1)..-1].max - price
            end
        end

        puts "Buy on Day #{day_to_buy} and sell on Day #{day_to_sell} for a profit of $#{profit}!"
    end
end

stock_picker([1, 6, 37, 4, 4, 9])
stock_picker([37, 4, 1])
stock_picker([37, 4, 19, 8, 12])
stock_picker([37, 7, 9, 16, 25, 1])
stock_picker([7, 19, 1, 18, 4])
stock_picker([400, 7, 19, 1, 18, 4])