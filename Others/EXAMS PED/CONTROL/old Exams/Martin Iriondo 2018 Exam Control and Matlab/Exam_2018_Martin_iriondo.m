%1
clc
clear all
close all
s=tf([1 0],[1]);
z=tf([1 0],[1], -1);
sisotool

%%
%2
s=tf([1 0],[1]);
G=320/(s*(s^2+16*s+64))
bode(G)
margin(G)
roots([1 16 64])

%%
%3
clc
clear all
syms y
f=1/y
deriv=diff(f)
%%
%)P4
clc
clear all
syms s k
G=(s+10)/((s+2)*(s+6))
f=G
deriv=simplify(diff(f))
pol=roots([-1 -20 -68])
K=k
Gp=simplify(K*G/(1+K*G))

s=tf([1 0],[1]);
G=(s+10)/((s+2)*(s+6))
sisotool(G)
%%
%)P5
clc
clear all
k=0:0.1:3
x=-1.333-1.333*(0.5.^k)
plot(k,x)
%%
%7
clc
clear all
close all
T=1
t1=2
t2=10
z=tf([1 0],[1], T);
s=(z-1)/T
G=((t1*s+1)/(t2*s+1))
bode(G)
%%
%problem8
clc
clear all
close all
T=0.1;
s=tf([1 0],[1]);
Gp=100/(s*(s+10))
Gz=c2d(Gp,T,'zoh')
[num,den] = tfdata(Gz,'v')
z=roots(num)
p=roots(den)
figure(1)
rlocus(Gz)

T=1;
s=tf([1 0],[1]);
Gp=100/(s*(s+10))
Gz=c2d(Gp,T,'zoh')
figure(2)
rlocus(Gz)
%%
%4)
syms z 
Gz=simplify((0.3679*z+0.2642)/(z^2-1.368*z+0.3679));
D=0.3
Gol=0.3*(0.3679*z+0.2642)/(z^2-1.368*z+0.3679)
Gcl=simplify(D*Gz/(1+Gol))
den=[100000 -125763 44716]

p=roots(den)
%%
%Matlab exercises
%problem9
vector=cos(2*pi*(1:100)/100)
rms(vector)
n=length(vector)
emaitza=0
for i=1:1:n
Vector2(i)=(vector(i))^2
end
a=sum(Vector2)
rms_value=sqrt((1/n)*a)
%%
clc
clear all
close all
%problem 10
x=[5]
sum_array=sum(x)
if mod(sum_array,2)==1
y=false
else
y=true
end
%%
clc
clear all
close all
%problem 11
v=[17.5 18.5 19 18.5 19]
vector_sorted=sort(v)
new_vector=vector_sorted(2:end-1)
sum_vector=sum(new_vector)