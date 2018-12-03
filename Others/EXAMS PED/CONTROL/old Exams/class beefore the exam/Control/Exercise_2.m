clc;
clear;
close all;

s = tf('s');
G1 = 1/s;
w1 = 0.1;
w2 = 10;
zeta = 0.3;
K = 10;

G = K*w2^2/(s^2+2*zeta*w2*s+w2^2)*(s+w1)/w1*1/s;
margin(G)
grid on

