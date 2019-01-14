function y = percentPassed(x)

passed=0;
        for i=1:length(x)
            if x(i)>00 
                passed=passed+1
            end 
        end 
        
    y = (sum(passed)/length(x))*100;
end