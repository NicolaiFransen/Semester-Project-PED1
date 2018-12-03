%right !
%EXAM 2017 
%% 250/2500 us single-stage impulse generator type b
clear all
C1 = 20*10^(-9);
C2 = 2*10^(-9);
alpha1 = 1/(2877*10^(-6));
alpha2 = 1/(104*10^(-6));
Vo=(50e+03);

%k=(4.456e-7);

R1 = 1/(2*C2)*((1/alpha1+1/alpha2)-sqrt((1/alpha1+1/alpha2)^2-((4*(C1+C2))/(alpha1*alpha2*C1))));
R2 = 1/(2*(C2+C1))*((1/alpha1+1/alpha2)+sqrt((1/alpha1+1/alpha2)^2-((4*(C1+C2))/(alpha1*alpha2*C1))));
t=0:0.00000001:0.005;
k = R1*C2
V=((Vo/k)*(1/(alpha2-alpha1)))*(exp(-alpha1*t)-exp(-alpha2*t));
plot(t,V)
grid

% G=tf (33.3333,[4.1200e-08 2.0000e-04 1])
% bode(G)
% margin(G)


%------------------------------------

% (224400*(exp((-1/68.2e-06)*0.5e-06)-exp((-1/0.405e-06)*0.5e-06)))

