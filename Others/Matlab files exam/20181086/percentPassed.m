function percentPassed(x) 
counter = 0
    for index = 1:length(x)
        if x(index) < 2
            counter = counter + 1
        end
    end
    (length(x)-counter)/length(x)
end