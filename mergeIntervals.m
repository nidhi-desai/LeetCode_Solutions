function [output] = mergeIntervals(input)
% Problem Link: https://leetcode.com/problems/merge-intervals/
arr = sortrows(input,1);
newArr = [];
temp = arr(1,:);
for p = 1:size(arr,1)-1
    if arr(p+1,1) <= temp(2)
        temp(2) = max(arr(p+1,2),temp(2));
    else
        newArr = [newArr; temp];
        temp = arr(p+1,:);
    end
    if p == size(arr,1)-1
        newArr = [newArr; temp];
    end
end
output = newArr;

end
