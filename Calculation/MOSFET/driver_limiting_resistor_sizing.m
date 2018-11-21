clc
close all
% 
% Script for supporting the calculation of the limiting resistor
% from driver to mosfet gate
%

V_driver = 12

%rise time of MOSFET, fall time is smaller, then this is the most
%demanding constraint. Obtained from simulation.
% tsw_MOSFET = 15e-9

%datasheet values
R_driver = 0.4
R_gate_MOSFET = 2.4
C_gate = 1.815e-9

%experimental value from SPICE simulation
V_gs_th = 4.7

%sweep analysis
R_limiting = 5:5:100;

R = R_driver + R_gate_MOSFET + R_limiting;

%Capacitor charge in a RC circuit
tsw_RC = -R * C_gate * log(-(V_gs_th/V_driver -1));

%Peak power dissipation in limiting resistor
I_pk = V_driver ./ R;
P_pk_R_limiting = I_pk.^2 .* R_limiting;
P_pk_R_MOSFET = I_pk.^2 .* R_gate_MOSFET;

%total time adding MOSFET rise time and RC charge
% DEPRECATED, mosfet time not considered. tsw_total will be a delay
% in the system from the driver input to the actual mosfet switching
tsw_total = 0 + tsw_RC;

figure(1)
plot(R_limiting, tsw_total)
legend('switching time against driver resistor')

figure(2)
plot(R_limiting, I_pk)
hold on
plot(R_limiting, P_pk_R_limiting)
hold on 
plot(R_limiting, P_pk_R_MOSFET)
legend('I_pk', 'P_pk_R_limiting', 'P-pk-R-MOSFET)')



