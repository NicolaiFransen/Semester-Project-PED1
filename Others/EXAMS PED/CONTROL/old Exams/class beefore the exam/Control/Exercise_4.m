clc;
clear;
close all;

s = tf('s');

Kp = 1;
Ki = 40;

Gc = Kp*(s+Ki)/s;
Gp = 1000/(s^2 + 20*s + 100);
Gol = Gc*Gp;

rlocus(Gol)

Kp = 100/(50*Ki-1000)