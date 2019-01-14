function y=sum2n(n)

   variable = 0;
    for i=1:2^(n)
        variable = variable + i;
    end
    y = variable;
end

