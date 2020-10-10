function [finalSum] = AddTwoStrings(a,b)
% Problem link: https://leetcode.com/problems/add-strings/
% a and b are postive integers in string format
% Cannot convert them directly to numbers

temp = [size(a,2),size(b,2)];
[maxLen, maxIndx] = max(temp);
diffLen = max(temp) - min(temp);
if maxIndx == 1
    shorterTemp = strcat(repmat('0',1,diffLen), b);    
    longerTemp = a;
else
    shorterTemp = strcat(repmat('0',1,diffLen), a);
    longerTemp = b;
end
finalSum = string();
carryOver = 0;
for i = 0:maxLen-1
    thisSum = str2num(shorterTemp(end-i)) + str2num(longerTemp(end-i)) + carryOver;
    if thisSum < 10
        finalSum = strcat(string(thisSum), finalSum);
        carryOver = 0;
    else
        finalSum = strcat(string(rem(thisSum,10)), finalSum);
        carryOver = (thisSum - rem(thisSum,10))/10;
    end
end
end
