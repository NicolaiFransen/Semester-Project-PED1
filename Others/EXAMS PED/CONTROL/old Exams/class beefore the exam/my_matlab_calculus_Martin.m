clc
clear all
close all
%Proeblem1
sisotool
%%
%problem2
s=tf([1 0],[1]);
bad=10000*(s+0.1)/(s*(s+10)^2);
bode(bad)
figure(2)
good=10000*(s+0.1)/(s*(s^2+20*0.354*s+100));
bode(good)
GCL=good/(1+good)
GCL=(simplify(GCL))
%roots
[num,den] = tfdata(GCL,'v')
z=roots(num)
p=roots(den)


syms s
G=10000*(s+0.1)/(s*(s^2+20*0.354*s+100))
GCL=G/(1+G)
GCL=(simplify(G/(1+G)))
den=[25 177 252500 2500]
p=roots(den)
%%
clc
clear all
close all
syms s kp ki
G=1000*(kp*s+ki)/(s*(s^2+20*s+100))
GCL=G/(1+G)
GCL=(simplify(G/(1+G)))

%%
s=tf([1 0],[1]);
ki=40;
kp=1.9
G=1000*(kp*s+ki)/(s*(s^2+20*s+100))
%roots
[num,den] = tfdata(G,'v')
z=roots(num)
p=roots(den)

GCL=(simplify(G/(1+G)))
rlocus(G)

%%
%prroblem5
s=tf([1 0],[1]);
G=40.76/(s^2+4.816*s+45.3)
step(G)
%%
%PROBLEM 6
s=tf([1 0],[1]);
G=100/(s^3 +18*s^2+100*s)
figure(1)
bode(G)
Gc=(14.7*s+1)/(2.433*s+1)
figure(2)
bode(Gc)
figure(3)
bode(Gc*G)
%%
%Problem 7
s=tf([1 0],[1]);
G=2*(s+20)/((s+1)*(s+2)*(s+3))
nyquist(G)
sisotool(G)




%%
%dISCRETE `PART
%problem1 e)
A=-0.9
z=tf([1 0],[1], 1/10); % 0.1 sample time
D=(A*z+1)/(z+A)
bode(D)
%%
%Problem
syms z T
C=100+(3*(z-1)/T)/(0.3*((z-1)/T)+1)
C=simplify(C)
s=tf([1 0],[1]);
G=100+3*s/(0.3*s+1);
G=simplify(G)
step(G)
%%
%Problem3 
T=0.2
s=tf([1 0],[1]);
G=100/(s+10)^2
Gz=c2d(G,T,'zoh')
Gz=simplify(Gz)
%b)
G=10/(s+10)^2
Gz=c2d(G,T,'zoh')
Gz=simplify(Gz)
z=tf([1 0],[1], -1); 

Gol=Gz*1/z
rlocus(Gol)
%%
s=tf([1 0],[1]);
G=(1-2*s)/(s*(s+1))
figure(1)
nyquist(G)
Gcl=simplify(G/(1+G))
figure(2)
rlocus(Gcl)
%%
%more nyquist examples https://www.youtube.com/watch?v=NIfTN_QvISg
s=tf([1 0],[1]);
G=250/(s^2+4*s+50)
H=2/(s+2)
Gol=H*G
nyquist(Gol)
Gcl=simplify(G/(1+G*H))
figure(2)
rlocus(Gcl)
%%
s=tf([1 0],[1]);
G=(250*s+500)/(s^3+6*s^2+58*s+600)
figure(1)
nyquist(G)
Gcl=simplify(G/(1+G))
figure(2)
rlocus(G)
sisotool(G)

