function [ sum_of_evens ] = sumofevencubes( n )
for i=1:1:n
y(i)=(i)^3;
%EVEN(par) or ODD(impar)
if(rem(i,2)==0)
    z(i)=y(i);
    sum_of_evens=sum(z)
end

end

end

