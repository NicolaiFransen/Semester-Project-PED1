%% Problem 11

function myrms(n)
x = 0;
    for i = 1:length(n)
    x = x+ n(i)^2;
    end
    x_rms = sqrt(x/length(n))
end