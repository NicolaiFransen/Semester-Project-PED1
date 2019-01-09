close all
clear all
clc

% voltages_boost = 40:1:90;

Vmpp = 36.9;
Impp_400 = 3.23;
P = 300;
Vin_ripple = 0.001;
Vout_ripple = 0.005;
L = 1.3e-3;
% Current_ripple = 0.1;
fsw = 50e3;

% L_boost = (Vmpp*(1-Vmpp./voltages_boost)./(Current_ripple * Impp_400 * fsw));
% L_buck = (Vmpp - voltages_buck).*(voltages_buck./Vmpp)/(2 * Current_ripple * fsw);%to be checked
% 
%Cin_boost = ()/()
% Cin_buck = (P/Vmpp * (1 - voltages_buck/Vmpp)/(Vin_ripple * Vmpp * fsw));

% Cout_buck = (voltages_buck.^2/P .* (1 - voltages_buck ./ Vmpp))./(Vout_ripple .* voltages_buck .* fsw);
% Cout_boost = (P./voltages_boost .* (1 - Vmpp./voltages_boost)./(Vout_ripple .* voltages_boost * fsw));

% figure(1)
% plot(voltages_boost, Cout_boost)
% hold on
% plot(voltages_buck, Cout_buck)
% hold off
% legend('Cout boost', 'Cout buck')
% xlabel('Output voltage');
% ylabel('Capacitance');
% 
% figure(2)
% plot(voltages_boost, L_boost)
% hold on
% plot(voltages_buck, L_buck)
% hold off
% legend('L boost', 'L buck')
% xlabel('Output voltage');
% ylabel('Inductance');
% 
% figure(3)
% plot(voltages_buck, Cin_buck)
% legend('Cin buck')
% xlabel('Input voltage');
% ylabel('Capacitance');

%voltages_buck = 24;
P=50:5:300;
voltages_buck = 24:0.5:35;
Cout_buck = zeros(size(P,2), size(voltages_buck,2));

for i = 1 : size(P,2)
    for j = 1 : size(voltages_buck,2)
        %Cout_buck(i,j) = (P(i)/voltages_buck(j) * (1 - voltages_buck(j) / Vmpp))/(Vout_ripple * voltages_buck (j) * fsw);
        %Cout_buck(i,j) = (P(i) * (1/voltages_buck(j) - 1/Vmpp) * (1 - voltages_buck(j) / Vmpp))/(Vout_ripple * voltages_buck (j) * fsw);
        Cout_buck(i,j) = ((voltages_buck(j) / Vmpp) * Vmpp * (1- voltages_buck(j) / Vmpp)) / (L * 8 * fsw^2 * Vout_ripple * voltages_buck(j)); 
    
    end
end

% Cout_buck = (voltages_buck.^2./P .* (1 - voltages_buck ./ Vmpp))./(Vout_ripple .* voltages_buck .* fsw);


s = surf(voltages_buck, P, Cout_buck);

%s.EdgeColor = 'none';
% figure(4)
% plot(P, Cout_buck)



xlabel('V out');
ylabel('Power');
zlabel('C out');
    