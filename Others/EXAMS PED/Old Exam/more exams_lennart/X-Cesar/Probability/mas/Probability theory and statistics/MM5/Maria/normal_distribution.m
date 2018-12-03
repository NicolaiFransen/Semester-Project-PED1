clear all;



sol = 1 - normcdf(0.1,0.05,0.01);

sol2= normcdf(0.04,0.05,0.01);

sol3 = diff(normcdf([0.025 0.065],0.05,0.01))
