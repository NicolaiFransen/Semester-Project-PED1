close all
clc

voltages_boost = 40:1:90;
voltages_buck = 24:1:35;

Vmpp = 36.9;
Impp_400 = 3.23;
P = 300;
Vin_ripple = 0.001;
Vout_ripple = 0.005;
Current_ripple = 0.1;
fsw = 50e3;

L_boost = (Vmpp*(1-Vmpp./voltages_boost)./(Current_ripple * Impp_400 * fsw));
L_buck = (Vmpp - voltages_buck).*(voltages_buck./Vmpp)/(2 * Current_ripple * fsw);%to be checked
% 
%Cin_boost = ()/()
Cin_buck = (P/Vmpp * (1 - voltages_buck/Vmpp)/(Vin_ripple * Vmpp * fsw));

Cout_buck = (voltages_buck.^2/P .* (1 - voltages_buck ./ Vmpp))./(Vout_ripple .* voltages_buck .* fsw);
Cout_boost = (P./voltages_boost .* (1 - Vmpp./voltages_boost)./(Vout_ripple .* voltages_boost * fsw));

figure(1)
plot(voltages_boost, Cout_boost)
hold on
plot(voltages_buck, Cout_buck)
hold off
legend('Cout boost', 'Cout buck')

figure(2)
plot(voltages_boost, L_boost)
hold on
plot(voltages_buck, L_buck)
hold off
legend('L boost', 'L buck')

figure(3)
plot(voltages_buck, Cin_buck)
legend('Cin buck')


