clc;
clear;
close all;

A = [0 1 0;
     0 0 1;
     -5 -9 -5];
B = [0 0 2]';
C = [1 0 0];

sys = ss(A,B,C,[]);
G = tf(sys)

lambda = eig(A);

s = tf('s');
p = [-3 -4 -5];
alfa = (s-p(1))*(s-p(2))*(s-p(3));

K = acker(A,B,p);