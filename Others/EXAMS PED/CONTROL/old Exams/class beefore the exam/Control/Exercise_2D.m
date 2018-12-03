clc;
clear;
close all;

s = tf('s');
%%
Gs = 100 + 3*s/(0.3*s+1);
Dc = dcgain(Gs);

T = 1/1000; % Arbitrary
z = tf('z',T);

%%
Gz = 100 + 3*((z-1)/T)/(0.3*((z-1)/T)+1);
figure
step(Gs)
hold on
step(Gz)

%%
T = 1e-4;
z = tf('z',T);
Gz = 100 + 3*((z-1)/T)/(0.3*((z-1)/T)+1);
T = 1e-4;
figure
rlocus(Gz)
hold on
T = 6/10;
z = tf('z',T);
Gz = 100 + 3*((z-1)/T)/(0.3*((z-1)/T)+1);
rlocus(Gz)

%%
Dc = dcgain(Gz);
