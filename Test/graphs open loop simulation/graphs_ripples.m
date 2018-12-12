%% Ripple inductor. Boost mode: 400W/m2 irradiance. Vin = 36.19V, Iin=3.23A, Vout=90V, Rl=69ohm, Dboost=0.6
current_inductor = csvread('current_inductor.csv',1,0);

time_IL = current_inductor(:,1);
IL_ripple = current_inductor(:, 2);

figure(1)
plot(time_IL, IL_ripple)

%% Ripple input voltage. Buck mode: 1000W/m2 irradiance. Vin = 36.9V, Iin=8.14A, Vout=24V, Rl=2ohm, Dbuck=0.65
input_ripple= csvread('input_voltage_ripple.csv',1,0);

time_vin = input_ripple(:,1);
vin_ripple = input_ripple(:, 2);

figure(2)
plot(time_vin, vin_ripple)

%% Ripple output voltage. Buck mode: 1000W/m2 irradiance. Vin = 36.9V, Iin=8.14A, Vout=24V, Rl=2ohm, Dbuck=0.65
output_ripple= csvread('output_voltage_ripple.csv',1,0);

time_vout = output_ripple(:,1);
vout_ripple = output_ripple(:, 2);

figure(3)
plot(time_vout, vout_ripple)