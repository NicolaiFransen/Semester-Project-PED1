%Dynamics exam 2014 JUNE
clc
clear all
close all
%PARAMETERS:
f=50;% ojo igual cambia!!
Im1=10;
desfase_del_alfa=0
desfase_del_beta=0
t=[0:0.0001:0.02];
we=-2*pi*f;
alfa=Im1*cos(we.*t+desfase_del_alfa);
beta=Im1*sin(we.*t+desfase_del_beta);
figure(1)
plot(t,alfa,t,beta)
legend('alfa','beta')
grid on
%%
%1.b)
%PARAMETERS:
clear all
close all
f=50;% ojo igual cambia!!
Im1=10
desfase_del_a=0
%desfase_del_b=5*pi/6
%desfase_del_c=-pi/2
t=[0:0.0001:0.02];
we=2*pi*f;

a=Im1*cos(we.*t+desfase_del_a);%OJOO el 2-we
%b=Im1*cos(we.*t+desfase_del_b);
%c=Im1*cos(we.*t+desfase_del_c);
figure(2)
plot(t,a)
legend('a','b','c')
grid on

%%
%1.c)
%PARAMETERS:
clear all
f=50;% ojo igual cambia!!
Im1=10
desfase_del_a=0
desfase_del_b=-pi/2

t=[0:0.0001:0.01];
we=-2*pi*f;

d=Im1*cos(2*we.*t+desfase_del_a);%OJO el 2*we!
q=Im1*cos(2*we.*t+desfase_del_b);
figure(3)
plot(t,d,t,q)
legend('d','q')
grid on