% The goal of this script is to define the small signal
% model of power electronics converters mainly using tf MATlab class.
% 
% The procedure is:
%     1-Create SS model with the matrixes found by analysis
%     2-Validate model by finding appropriate bodes and system response
%     3-move to tf class in order to have all its tools?
% 
% sys = ss(A,B,C,D) creates a state-space model object representing the continuous-time state-space model
% 
% dx/dt=Ax+Bu
% y=Cx+Du

clearvars
close all
clc

%% Variable init
Ron = 0;
D1_boost = 0.5;
D2_boost = 1 - D1_boost;
D1_buck = 0.5;
D2_buck = 1 - D1;
R_buck = 3;
R_boost = 27;
L = 1.3e-3;
C = 200e-6;

%% Buck Converter - Line to output transfer function derivation: Vo/Vg
% %This snippet has as an input the system's space state equations
% %and transforms it to the transfer function of line to output.
% %
A_buck = [0 -1/L; 1/C -1/(R_buck*C)]
B_buck = [D1_buck/L; 0]
C_buck = [0 1]
D_buck = 0 %To set to 0 the scalar must be used. (MATlab docs)

%sys = ss(A,B,C,D)
%step(sys)
[num_buck_L2O, den_buck_L2O] = ss2tf(A_buck, B_buck, C_buck, D_buck)
buck_L2O = tf(num_buck_L2O, den_buck_L2O)
bodeplot(buck_L2O)


%% Boost Converter - Line to output transfer function derivation: Vo/Vg
%This snippet has as an input the system's space state equations
%and transforms it to the transfer function of line to output.
%
A_boost = [0 -D2_boost/L; D2_boost/C -1/(R_boost*C)]
B_boost = [-1/L; 0]
C_boost = [0 1]
D_boost = 0 %To set to 0 the scalar must be used. (MATlab docs)

%sys = ss(A,B,C,D)
%step(sys)
[num_boost_L2O, den_boost_L2O] = ss2tf(A_boost, B_boost, C_boost, D_boost)
boost_L2O = tf(num_boost_L2O, den_boost_L2O)
bodeplot(boost_L2O)

