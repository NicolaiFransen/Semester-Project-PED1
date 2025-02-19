close all;
clc;

%% Open loop simulation results - Buck mode (300W)
data = csvread('open_loop_buck_300W.csv');

t = data(:,1);
IL = data(:, 2);
Vout = data(:, 3);


figure(2)
plot(t, Vout, 'b', 'Linewidth', 1.5)
hold on
plot(t, IL, 'r', 'Linewidth', 1.5)
xlim([0.2, 0.5]);
ylim([0, 30]);
title('Output voltage ripple - Boost (300W)')
xlabel('Time[s]');
ylabel('Current[A], Voltage[V]');
legend('V_{out}');


%% Open loop simulation results - Boost mode (300W)
data = csvread('ripple_output.csv');

t = data(:,1);
IL = data(:, 2);
Vout = data(:, 3);


figure(1)
plot(t, Vout, 'b', 'Linewidth', 1.5)
hold on
plot(t, IL, 'r', 'Linewidth', 1.5)
xlim([0.3778, 0.3779]);
ylim([54, 56]);
title('Output voltage ripple - Boost (300W)')
xlabel('Time[s]');
ylabel('Voltage[V]');
legend('V_{out}');

% Ripples
Vmax = 55.156;
Vmin = 54.8798;

deltaVout = (Vmax-Vmin)/((Vmax+Vmin)/2) * 100 

%% Open loop simulation - coil ripple test
data = csvread('Coil_ripple_test.csv');

t = data(:,1);
IL = data(:, 2);
Vout = data(:, 3);


figure(3)
%plot(t, Vout, 'b', 'Linewidth', 1.5)
%hold on
plot(t, IL, 'r', 'Linewidth', 1.5)
xlim([0.3777, 0.3778]);
ylim([2.8, 3.8]);
title('Inductor current ripple')
xlabel('Time[s]');
ylabel('Current[A]');
legend('I_L');

% Ripples
Imax = 3.465;
Imin = 3.135;

deltaIL = (Imax-Imin)/((Imax+Imin)/2) * 100

%% Open loop simulation results - input voltage ripple
data = csvread('Input_ripple.csv');

t = data(:,1);
Vout = data(:, 3);


figure(2)
plot(t, Vout, 'b', 'Linewidth', 1.5)
hold on
%plot(t, IL, 'r', 'Linewidth', 1.5)
xlim([0.2, 0.5]);
ylim([0, 40]);
title('Input voltage ripple')
xlabel('Time[s]');
ylabel('Voltage[V]');
legend('V_{In}');

Vmax = 36.9419;
Vmin = 36.905;
Vmean = (Vmax+Vmin)/2;

deltaVin = (Vmax-Vmin)/Vmean *100