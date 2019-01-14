function t = mrms(n)

d = 0;
counter = 0
for ii = 1:length(n)
    d = d + n(ii)*n(ii);
    counter = counter +1;
end

x_rms = sqrt((1/counter)*d)


end