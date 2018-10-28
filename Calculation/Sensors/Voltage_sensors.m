%% Voltage sensors
clear all
close all
clc

%% Input voltage sensor
% Voltage divider
Vin_max = 39.9;
Vin_min = 10;

V_sens = 2;
I_sens = 1e-3;

R1 = (Vin_max-V_sens)/I_sens

syms R
eqn = V_sens == Vin_max * (R/(R+R1));
R2 = solve(eqn, R)


% Amplification
V_0 = 1.23;

% For 5V output
V_plus = V_0 + 1;
V_min = V_0 - 1;
V_out = 5;

R3 = 10e3;                      % R4=R3

R5 = (V_out*R1)/(V_plus-V_min)  % R6=R5

%% Output voltage sensor
% Voltage divider
Vout_max = 90;
Vout_min = 24;

V_sens = 2;
I_sens = 1e-3;

R7 = (Vout_max-V_sens)/I_sens

syms R
eqn = V_sens == Vout_max * (R/(R+R7));
R8 = solve(eqn, R)
