function [output] = calculator(input)
% Problem Link: https://leetcode.com/problems/basic-calculator/
% input = string of numbers and evaluators

a = [strfind(input,'+'),strfind(input,'-')];
b = a(a~=1);
b = [b, length(input)];

[~,test] = str2num(input(1));
c = sort([strfind(input,'+'),strfind(input,'-'),strfind(input,'*'), strfind(input,'/')]);

if test % b(1) == 2
    temp = str2num(input(1:c(1)-1));
    start = 2;
elseif ~test % b(1) == 3 
    start = 2;
    if strcmp(input(1), '+') 
    	temp = str2num(input(2:c(1)-1));
    elseif strcmp(input(1), '-')
    	temp = str2num(input(1:c(1)-1));
    elseif strcmp(input(1), '*')  | strcmp(input(1), '/')
    	disp('invalid first symbol'); 
    	output = nan;
    	% break;
    end
else 
    start = 1;
    temp = [];
end

for w = start:length(b)
    if w == start & start == 1
        subSet = input(1:b(start)-1);
    elseif w == start & start == 2
        if length(b) == 2
        	subSet = input(b(1):b(start));
        else
            subSet = input(b(1):b(start)-1);
        end
    else 
        subSet = input(b(w-1):b(w));
    end
    
    t = str2num(subSet(2));
    [~,p] = str2num(subSet(1));
    if p == 1
        e = 2;
    else 
        e = 3;
    end
    t = str2num(subSet(e-1));
    
    for r = e:length(subSet)-1
    	if strcmp(subSet(r),'*')
       	t = t*str2num(subSet(r+1));
       elseif 	strcmp(subSet(r),'/')
       	t = t/str2num(subSet(r+1));
    	end
    end
    if strcmp(subSet(1), '-')
        temp = [temp; -t];
    else 
        temp = [temp; t];
    end
end

output = sum(temp);

end
