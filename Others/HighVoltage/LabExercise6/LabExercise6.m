%% Lab exercise 6
clear all
clc

bar_02 = [0.2 0.2 0.2 0.2 0.2];
bar_05 = [0.5 0.5 0.5 0.5 0.5];

% Data
data_02 = [8.9 7.9 6.9 5.9 5.9];
data_05 = [13.22 13.78 16.75 19.2 16.16];
data_1 = [23.17 26.55 28.98 33.8 29.94];
data_2 = [41 39.8 39.1 38.8 39.8];
data_3 = [50.4 55 55.4 51.4 53];

% Mean values
mu_02 = mean(data_02);
mu_05 = mean(data_05);
mu_1 = mean(data_1);
mu_2 = mean(data_2);
mu_3 = mean(data_3);

% Stanard deviations
std_02 = std(data_02);
std_05 = std(data_05);
std_1 = std(data_1);
std_2 = std(data_2);
std_3 = std(data_3);

data_max = [mu_02+2*std_02 mu_05+2*std_05 mu_1+2*std_1 mu_2+2*std_2 mu_3+2*std_3]; 
data_min = [mu_02-2*std_02 mu_05-2*std_05 mu_1-2*std_1 mu_2-2*std_2 mu_3-2*std_3]; 


%% Plot
data_mean = [mu_02; mu_05; mu_1; mu_2; mu_3];
pd = [0.2; 0.5; 1; 2; 3];

figure(1)
semilogx(pd, data_mean, 'b')
hold on
semilogx(pd, data_max, '--r')
semilogx(pd, data_min, '--g')
legend('Mean value', '+2*sd', '-2*sd')
xlabel('Pressure, pd (Bar)') 
ylabel('Breakdown voltage (kV)')

%% Opt
clear all
clc
pd = 1;
fun = @(x) x(1)*pd*10e3 + x(2)*sqrt(pd);
x0 = [6, 24];
x = fminsearch(fun, x0)