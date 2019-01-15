%% Porblem 9

function sum2n(n)
    out = 0;
    for i = 1:2^n
        out = out + i;
    end
    out
end