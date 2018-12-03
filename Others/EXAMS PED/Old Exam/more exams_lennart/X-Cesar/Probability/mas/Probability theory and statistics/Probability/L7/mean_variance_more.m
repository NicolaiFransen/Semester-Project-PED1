close all;
clear;
clc;
% data
grades = [3.2 1.9 2.7 2.4 2.8 2.9 3.8 3.0 2.5 3.3 1.8 2.5 3.7 2.8 2.0 3.2 2.3 2.1 2.5 1.9]

possible_grades = [-3 0 2 4 7 10 12];

n = histc( grades, possible_grades );
bar( possible_grades, n );

%% statistics

a1 = mean( grades )
b1 = mode( grades )
c1 = median( grades )

%% more statistics

d1 = range( grades )
e1 = var( grades )
f1 = std( grades )

%% CLT

% the number of observations in each experiment
N = 100;

% the number of replicated experiments
M = 50;

% normal values
mu = 2;
s = 3;
normal_values = mu + s*randn(N, M);

% uniform values
a = 0;
b = 2;
uniform_values = a + (b - a).*rand(N, M);

% Chi squared values
nu = 4;
chi2_values = chi2rnd( 4*ones(N, M) );


% plot histograms
subplot(2, 3, 1)
hist( normal_values(:) )
subplot(2, 3, 2)
hist( uniform_values(:) )
subplot(2, 3, 3)
hist( chi2_values(:) )

subplot(2, 3, 4)
hist( (mean(normal_values) - mu)/(s/sqrt(N)) )
subplot(2, 3, 5)
hist( (mean(uniform_values) - mean(a+b))/( (a-b)/(sqrt(12*N)) ) );
subplot(2, 3, 6)
hist( (mean(chi2_values) - nu)/(sqrt(2*nu*N)) )

%% Car example - known variance

x = [1.9 2.4 3.0 3.5 4.2];

% sample variance
S = std(x)
4*S

% plot Chi square distribution
plot( 0:0.1:10, chi2pdf(0:0.1:10, 4) )
 






