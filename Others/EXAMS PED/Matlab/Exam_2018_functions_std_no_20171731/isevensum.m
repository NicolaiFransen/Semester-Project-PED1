function [ y ] = isevensum( vector )
%problem 10
%[1 2 3]
sum_array=sum(vector);
if mod(sum_array,2)==1
y=false
else
y=true
end


end

