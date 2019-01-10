close all
clc

voltages_boost = 36.9:1:90;
voltages_buck = 24:1:36.9;

Vmpp = 36.9;
Impp_400 = 3.23;
P = 300;
Vin_ripple = 0.001;
Vout_ripple = 0.005;
Current_ripple = 0.1;
fsw = 50e3;
L=1.3e-3;

L_boost = (Vmpp*(1-Vmpp./voltages_boost)./(Current_ripple * Impp_400 * fsw));
L_buck = (Vmpp - voltages_buck).*(voltages_buck./Vmpp)/(2 * Current_ripple * fsw);%to be checked
% 
%Cin_boost = ()/()
Cin_buck = (P/Vmpp * (1 - voltages_buck/Vmpp)/(Vin_ripple * Vmpp * fsw));

%Cout_buck = (voltages_buck.^2/P .* (1 - voltages_buck ./ Vmpp))./(Vout_ripple .* voltages_buck .* fsw);
Cout_buck = ((voltages_buck ./ Vmpp) .* Vmpp .* (1- voltages_buck ./ Vmpp)) ./ (L .* 8 .* fsw^2 .* Vout_ripple .* voltages_buck);
Cout_boost = (P./voltages_boost .* (1 - Vmpp./voltages_boost)./(Vout_ripple .* voltages_boost * fsw));

figure(1)
plot(voltages_boost, Cout_boost, 'linewidth', 3)
hold on
plot(voltages_buck, Cout_buck, 'linewidth', 3)
hold off
legend('Cout boost', 'Cout buck')
xlabel('Output voltage [V]');
ylabel('Capacitance [F]');

figure(2)
plot(voltages_boost, L_boost, 'linewidth', 3)
hold on
plot(voltages_buck, L_buck, 'linewidth', 3)
hold off
legend('L boost', 'L buck')
xlabel('Output voltage [V]');
ylabel('Inductance [H]');

figure(3)
plot(voltages_buck, Cin_buck, 'linewidth', 3)
legend('Cin buck')
xlabel('Input voltage [V]');
ylabel('Capacitance [F]');

voltages_buck = 24;
P=50:1:300;

Cout_buck = (voltages_buck.^2./P .* (1 - voltages_buck ./ Vmpp))./(Vout_ripple .* voltages_buck .* fsw);

figure(4)
plot(P, Cout_buck)



xlabel('Power');
ylabel('Capacitance');
    

