clc
close all
clear all
s=tf1([1 0],[1]);
G=10000/(s*(s^2+14*s+100))
bode(G)
%%
%problem 3
syms v
Fs=2
Fc=1
B=1
alfa=2
f=(Fc+(Fs-Fc)*exp(-alfa*v)+B*v);
deriv=diff(f)
answer=(simplify(deriv))

%%
%problem 4
close all
s=tf([1 0],[1]);
G=0.8/(s*(s^2+1.2*s+1))
figure(1)
bode(G)
figure(3)
Gcl=G/(1+G)
step(Gcl)
%margin(G)
Gc=(0.6154*s+0.03138)/s
figure(2)
bode(G*Gc)
figure(4)
Gcl2=G*Gc/(1+G*Gc)
step(Gcl2)
%now lets compare the PID from exercises 4 (from class)
s=tf([1 0],[1]);
G=50/((s+1)*(s+2)*(s+5))

figure(5)
Gcl=G/(1+G)
step(Gcl)
%margin(G)
Gc=(1.18*s+0.04+0.167*s^2)/s

figure(6)
Gcl2=G*Gc/(1+G*Gc)
step(Gcl2)
%%
%Problem 6 2)
clear all
p=[1 -0.6 0.7 -0.8]
p=roots(p)
z=tf1([1 0],[1], -1); 
tf1=(z^3)/(z^3-0.6*z^2+0.7*z-0.8)
rlocus(tf1)
figure(2)
bode(tf1)
%%
%Problem 6 1)
clc
clear all
T=3
s=tf1([1 0],[1]);
G=1/s^2
Gz=c2d(G,T,'zoh')
%2)%rlocus
rlocus(Gz)
[num,den] = tfdata(Gz,'v')
z=roots(num)
p=roots(den)
syms z
f=4.5*(z+1)/(z^2 -2*z+1)
deriv=diff(f)
answer=(simplify(deriv))

%3)comprobacion
%%
k=1
syms z
D=k
Gz=(T^2)*(z+1)/(2*(z-1)^2)
Gclz=D*Gz/(1+D*Gz)
answer2=(simplify(Gclz))
p=[1 2.5 5.5]
roots(p)

%%
%Problem8
clc
clear all
close all
syms a b T z

s=(z-1)/T
tf1=(s+a)/(s^2+b*s)
answer=(simplify(tf1))
%3)

a=2;
b=20;
T=1
s=tf([1 0],[1]);
tf=(s+a)/(s^2+b*s)
tfz=c2d(tf,T,'zoh')
rlocus(tfz)

%%
%Matalab example?? from z to k?
syms p(n) z
f = p(n+2) - p(n+1) - p(n)
fZT = ztrans(f,n,z)
syms pZT
fZT = subs(fZT,ztrans(p(n),n,z),pZT)