clc;
clear;
close all;

Ts = 1/5;
s = tf('s');

G = 100/(s+10)^2;
Gz = c2d(G,Ts,'zoh');




a = 10;


z = tf('z',Ts);
Gz2 = ((1 -exp(-a*Ts) - a*Ts*exp(-a*Ts))*z + (exp(-2*a*Ts)+(a*Ts-1)*exp(-a*Ts)))/((z-exp(-a*Ts))^2);
% Gz2 = 0.595*(z+0.258)/((z-0.135)^2);
figure
impulse(G)
hold on
impulse(Gz)
impulse(Gz2,'--')

%%
H = 0.1;
K = 1;
D = K/z;
Gol = D*Gz*H;
figure
rlocus(Gol)

%%
Goh = (1-exp(-s*Ts))/s;
figure
bode(Goh)