clc 
clear all
close all
%1)
M=[0 0 0 0 
   0 0 0 0
   0 0 0 0]
%2)
V1=[57 46 35 -20]
V2=[1 2 3 4]
V3=[10 12 14 16]
V4=[25 24 23 22]
%3
M1=[V2;V3;V4]
%4 size of a vector
% v=[0.4 0.9 1.3 2.4 0.4 5.3];
% i=[0.4 0.5 0.2 0.7 0.4 0.5];
% x=i(2:end);
% M=[v;i];
a=M1(1,:);
b=M1(:,1);
a=length(a);
b=length(b);
%size(M)
fprintf('the matrix has a %d x %d size',b,a)
fprintf('the matrix has a %2.3f x %2.3f size',b,a)
%%


%%
X=[0.5079 0.0855 0.2625 0.801]
Y=[0.02992 0.9289 0.7303 0.4886]
N=length(X)
P = polyfit(X,Y,N)
P=P(1,end)
ber=length(P)-1
emaitza=0;
for i=1:ber
    pol=P(i)*X(i)^ber;
    emaitza=emaitza+pol;
    y(i)=emaitza;
end
plot(y,X)

