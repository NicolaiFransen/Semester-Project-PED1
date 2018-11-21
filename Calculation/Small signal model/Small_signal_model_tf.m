% The goal of this script is to define the small signal
% model of power electronics converters maily using tf MATlab class.
% 
% The procedure is:
%     1-Create SS model with the matrixes found by analysis
%     2-Validate model by finsing appropriate bodes and system response
%     3-move to tf class in order to have all its tools?
% 
% sys = ss(A,B,C,D) creates a state-space model object representing the continuous-time state-space model
% 
% dx/dt=Ax+Bu
% y=Cx+Du

clearvars
clc


Ron = 0;
D2 = 0.5;
D1 = 1 - D2;
Rout = 2



A = [Ron*(D2 - 2) -1; 1-2*D2 (2*D2-1)/Rout]
B = [D1 0; 0 0]
C = [D1 0]
D = [1 0]

sys = ss(A,B,C,D)

