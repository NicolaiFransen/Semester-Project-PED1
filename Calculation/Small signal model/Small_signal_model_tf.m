% The goal of this script is to define the small signal
% model of power electronics converters mainly using tf MATlab class.
% 
% The procedure is:
%     1-Create SS model of common buck with the matrixes found by analysis - ?
%     2-Validate model by finding appropriate bodes and system response - ?
%     3-move to tf class in order to have all its tools - ?
%       
%     4-Define transfer function of system with pv as input (system's
%     output is Vpv)
%     5-Define sensor transfer function (include digital filter?)
%     6-Define controller tf
%     7-Analyze closed loop Bode and change the controller in order to get
%     appropriate gain and phase margin. 
%     8-...
% 
% Space-State info
%   sys = ss(A,B,C,D) creates a state-space model object representing the continuous-time state-space model
%   Equation:
%       dx/dt=Ax+Bu
%       y=Cx+Du

clearvars
close all
clc

%% Variable init
Ron = 0;
D1_boost = 0.5;
D2_boost = 1 - D1_boost;
D1_buck = 0.5;
D2_buck = 1 - D1_buck;
R_buck = 3;
R_boost = 27;
L = 1.3e-3;
C = 200e-6;

%% Voltage sensor tf definition
sensortf = 2e3/(6.392*s + 49e3)

%% Buck Converter - Line to output transfer function derivation: Vo/Vg
% %This snippet has as an input the system's space state equations
% %and transforms it to the transfer function of line to output.
% %
close all
A_buck_L2O = [0 -1/L; 1/C -1/(R_buck*C)]
B_buck_L2O = [D1_buck/L; 0]
C_buck_L2O = [0 1]
D_buck_L2O = 0 %To set to 0 the scalar must be used. (MATlab docs)

%sys = ss(A,B,C,D)
%step(sys)
[num_buck_L2O, den_buck_L2O] = ss2tf(A_buck_L2O, B_buck_L2O, C_buck_L2O, D_buck_L2O)
buck_L2O = tf(num_buck_L2O, den_buck_L2O)
bodeplot(buck_L2O)
pole(buck_L2O)
isstable(buck_L2O)

%% Buck Converter - Control to output transfer function Vo/d
%From the small signal model, Vg input is set as 0 and d becomes the input
close all

%Working conditions
IL = 10 
VO = 24
VG = 36

A_buck_C2O = [0 -1/L; 1/C -1/(R_buck*C)]
B_buck_C2O = [VG/L; 0]
C_buck_C2O = [0 1]
D_buck_C2O = 0 %To set to 0 the scalar must be used. (MATlab docs)

%sys = ss(A,B,C,D)
%step(sys)
[num_buck_C2O, den_buck_C2O] = ss2tf(A_buck_C2O, B_buck_C2O, C_buck_C2O, D_buck_C2O)
buck_C2O = tf(num_buck_C2O, den_buck_C2O)
bodeplot(buck_C2O)
pole(buck_C2O)
isstable(buck_C2O)

%% Boost Converter - Line to output transfer function derivation: Vo/Vg
%This snippet has as an input the system's space state equations
%and transforms it to the transfer function of line to output.
%
close all
A_boost = [0 -D2_boost/L; D2_boost/C -1/(R_boost*C)]
B_boost = [-1/L; 0]
C_boost = [0 1]
D_boost = 0 %To set to 0 the scalar must be used. (MATlab docs)

%sys = ss(A,B,C,D)
%step(sys)
[num_boost_L2O, den_boost_L2O] = ss2tf(A_boost, B_boost, C_boost, D_boost)
boost_L2O = tf(num_boost_L2O, den_boost_L2O)
bodeplot(boost_L2O)
pole(boost_L2O)

%% Boost Converter - Control to output transfer function Vo/d
%From the small signal model, Vg input is set as 0 and d becomes the input
close all

%Working conditions
IL = 4 
VO = 80
VG = 36

A_boost_C2O = [0 -D2_boost/L; D2_boost/C -1/(R_boost*C)]
B_boost_C2O = [VO/L; -IL/C]
C_boost_C2O = [0 1]
D_boost_C2O = 0 %To set to 0 the scalar must be used. (MATlab docs)

%sys = ss(A,B,C,D)
%step(sys)
[num_boost_C2O, den_boost_C2O] = ss2tf(A_boost_C2O, B_boost_C2O, C_boost_C2O, D_boost_C2O)
boost_C2O = tf(num_boost_C2O, den_boost_C2O)
bodeplot(boost_C2O)
pole(boost_C2O)
isstable(boost_C2O)

%% Controller design
close all 

Kp = 50;
Ki = 1;
Kd = 0;
s = tf('s')
Unity_tf = tf(1)

Controller = pid(Kp, Ki, Kd)
G = Controller * buck_L2O

unityclosedlooptf = (feedback(G, Unity_tf))
closedlooptf = feedback(G, sensortf)
bode(unityclosedlooptf)
margin(unityclosedlooptf)



