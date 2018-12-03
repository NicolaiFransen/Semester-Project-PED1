
%porblem2 PI
clc
clear all
close all

s=tf([1 0],[1]);
G=(130)/((s+2)*(s+8))

figure(1)
bode(G);
%%
%Bode plot of an open loop system G(s):
%porblem3
clc
clear all
close all

s=tf([1 0],[1]);
G=(105.41*(s+0.3))/(s*(s+10)^2)

figure(1)
bode(G);
%%
clc
clear all
close all
%eq=controller+plant
s=tf([1 0],[1]);
E=10*(1+s)/(s*(s^2+s+1))
sisotool(E)
rlocus(E)
%%
%Problem 5
clc
clear all
close all
t=[0:0.01:10];
e=1+cos((pi/5)*t);

plot(t,e)
%%
%6) from time domain to s domain

clc
clear all
close all
%eq=controller+plant
T=0.00333;
s=tf([1 0],[1]);
z=tf([1 0],[1], -1); 
c=1000*(s+5)/(s+30)
cz=1000*(z-(1-5*T))/(z-(1-30*T))
% to pass from continuous to discrete with a sample time of 0.75
step(c,cz)


%%
%problem 7

clc
clear all
close all
%eq=controller+plant
T=2;
s=tf([1 0],[1]);
Gp=10/(s^2);
G=c2d(Gp,T,'zoh')% to pass from continuous to discrete with a sample time of 0.75
rlocus(G)
sisotool(G)
%%
%derivadas con matlab
clc
clear all
k=1;
syms z
f=(20*(z+1)*k)/(z^2-2*z+1);
deriv=diff(f)
answer=(simplify(deriv))
%result=pretty(answer)
%%


n2=n(2:end,1)
mean_value=mean(n2)