function t = percentpassed(n)
counter = 0;
for ii = 1:length(n)
if(n(ii)> 0)
    counter= counter+1;
    
end
s=length(n);
sum = counter/s;
disp(sum)


end