clc;
clear;
close all;

Ts = 1/10;
z = tf('z',Ts);
A =-0.9;
D = (A*z + 1)/(z+A);
bode(D)
return

%%
s = tf('s');
G = 1/s;
Gz = c2d(G,Ts);

%%
A = -0.9;
Dz = (A*z + 1)/(z+A);
e = [1 -1 0 0];
[y,t] = lsim(Dz,e);
plot(t,y,'kx')

%%
%bode(Dz);