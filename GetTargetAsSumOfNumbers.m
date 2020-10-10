function GetTargetAsSumOfNumbers(target)
% Problem Link: https://leetcode.com/discuss/interview-question/330653/facebook-phone-screen-sum-to-target
% Add (insert) the mathematical operators + or - (plus or minus) before any
% of the digits in the decimal numeric string "123456789" such that the 
% resulting mathematical expression adds up to a particular target sum.
% Example: 123 + 4 - 5 + 67 - 89 = 100

num = '123456789';
target = 100;
% 1=plus, -1=minus, 0=nothing
soln = zeros(8,1);
for w = 8:-1:1
    if sum(1:w)+(w+1) == target
        soln(w) = 1;
    elseif sum(1:w)-(w+1) == target 
        soln(w) = -1;
    else
        soln(w) = 0;
    
        
    
    end
end
end
