function [output] = buyAndSellStocks(input)
% Problem Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

prices = input';
numDays = size(prices,1);
output = [0, 0, 0];

for d = 1:numDays-1
    [tempMax, indx] = max(prices(d+1:numDays) - prices(d));
    if tempMax > output(3);
        output = [d, d+indx, tempMax];
    end
end

end
