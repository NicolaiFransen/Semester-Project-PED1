function [ sum_of_points ] = ski_jumping( v )
%problem 11
%v=[17.5 18.5 19 18.5 19]
vector_sorted=sort(v);
new_vector=vector_sorted(2:end-1);
sum_of_points=sum(new_vector)
end

