%Exam dynamics machines 2016
%sketch waveforms
clc
clear all
close all

%PARAMETERS:
f=50;% ojo igual cambia!!
Magnitude=10;% ojo igual cambia!!
desfase_del_d=-pi/6;% ojo igual cambia!!
desfase_del_q=-2*pi/3;% ojo igual cambia!!
t=[0:0.0001:0.02];;% ojo igual cambia!!
we=2*pi*f;
Fid=Magnitude*cos(2*we.*t+desfase_del_d);
Fiq=Magnitude*cos(2*we.*t+desfase_del_q);

plot(t,Fid,t,Fiq)
legend('Fid','Fiq')
grid on
%%
A=[1 2 3
   2 5 6
   1 6 7]
B=[1 3 9]'
