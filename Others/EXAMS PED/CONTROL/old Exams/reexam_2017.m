%%
%Problem 3 b)
clc
clear all
close all
s=tf([1 0],[1]);
G=(s+8)/((s+2)*(s+4))
rlocus(G)

k=1;
syms s
f=(s+8)/((s+2)*(s+4))
deriv=diff(f)
answer=(simplify(deriv))
%result=pretty(answer)

p=[-1 -16 -40];
a=roots(p)
sisotool(G)
%%
%problem4 
s=tf([1 0],[1]);
G=(16)/(s^2+6.4*s+16)
figure(6)
rlocus(G)
sisotool(G)
%%
%Problem5 1)
p=[1 -1.2 0.27]
a=roots(p)
z=tf([1 0],[1], -1); 
D=(3*z^2-0.3*z)/(z^2-1.2*z+0.27)
rlocus(D)
%problem5 2)
Ts=5e-3
H = tf([1 0], [1 -1], 1)
Hc = d2c(H)
%%
%Problem 5 6)
clc
clear all
close all
t=[0:0.001:0.1];
e=2*exp(-200*t)

plot(t,e)
%%
%Problem 6 1)
T=0.005;
s=tf([1 0],[1]);
C=10000/(s^2+30*s+10000)
F=c2d(C,T,'tustin')
%2)
%zeros roots
z=[0.25/4.55 0.5/4.55 0.25/4.55]
roots(z)
%poles
p=[1 -7.5/4.55 3.95/4.55]
roots(p)
%3)
%zdomain rlocus
rlocus(F)
figure(2)
%pzmap(feedback(F,T));zgrid
%sdomain rlocus
figure(3)
rlocus(C)
%%
%problem 7
close all
clc
clear all
s=tf([1 0],[1]);
Gp=10/s;
H=1/(10*s+1);
M=Gp*H
bode(M)
%3) exercise

T=1;
G=c2d(Gp,T,'zoh')
M=c2d(M,T,'zoh')
%roots
[num,den] = tfdata(M,'v')
z=roots(num)
p=roots(den)
figure(2)
rlocus(M)
%derivada
syms z
f=(0.4837*z+0.4679)/(z^2-1.905*z+0.9048);
deriv=diff(f)
answer=(simplify(deriv))

k=0.02
Gcl=G*k/(1+k*M)
%result=pretty(answer)

syms x
anse=simplify((x-0.942+0.129i)*(x-0.942-0.129i))
sisotool(Gcl)
%%
clc
clear all
close all
kont=5

for i=1:1:kont
y(i)=(i)^3
%EVEN(par) or ODD(impar)
if(rem(i,2)==0)
    z(i)=y(i)
    total=sum(z)
end

end
%%
%the same for odds
clc
clear all
kont=5
for i=1:1:kont
y(i)=(i)^3
%EVEN(par) or ODD(impar)
if(rem(i,2)~=0)
    z(i)=y(i)
    total=sum(z)
end

end
%%
clc
clear all
close all
%Heron´s method
S=831
kont=0
xo=S/2;
accuracy=3
while i~=1
    kont=kont+1
    solution=(1/2)*(xo+S/xo)
    if solution==sqrt(S)
    i=1;
    end
    xo=solution
end
fprintf('%2.8f',accuracy)