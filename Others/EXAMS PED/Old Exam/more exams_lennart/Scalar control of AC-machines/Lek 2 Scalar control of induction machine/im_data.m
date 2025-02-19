%% IM_DATA.M %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                %
% data file for induction machine model type ABB MT100LA28-4,    %
% ratings: 3*380-420/440-480VY, 50/60Hz 2.2/2.5kW, 2 pole pairs  %
% motor and load parameters                                      %
%                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear

% Induction motor constant parameters

Lm = 235.0e-3;                            %   magnetizing inductivity [H]%
Lds = 9.2e-3;                             %   stator leakage inductivity [H]%
Ldr = 12.29e-3;                           %   rotor leakage inductivity [H]%
Ls = Lm + Lds;                            %   stator total inductivity [H]%
Lr = Lm + Ldr;                            %   rotor total inductivity [H]%
Rs = 3.67*1.5;                                %   stator resistance [ohms]%
Rr = 2.32;                                %   rotor resistance [ohms]%
p = 2.0;                                  %   number of pole-pairs %
p_b=p;
jm=0.0069;                                %   rotor inertia moment [Nm^2]
J=jm;

% Induction motor nameplate - ABB M2AA100LA
Pn = 2200;	                         % nominal power [W]
Un = 220;		        % nominal phase voltage RMS[V]
In = 5.1;		        % nominal current RMS[A]
fn = 50;		        % nominal frequency [Hz]
PF = 0.81;		        % nominal power factor [pu]
nn = 1430;		        % nominal shaft speed
Omegae = 2*pi*fn;                         % nominal electrical angular speed [rad]

% ____________________________________________________________________________________________
% For Scalar controller
Vs0 = Un;
fR  = fn;

% Slip compensation
IactRated = In*sqrt(2)*PF;	        %  nominal active power current [A]
ns  = fn*60/p;		        %  synchronous speed [rpm]
freq_sn = (ns-nn)/ns*fn;                  %  nominal slip [Hz]

leak_fact = 1- Lm^2/Lr/Ls;
tr_ping = leak_fact * Lr/Rr;

% ____________________________________________________________________________________________

Tr = Pn/(nn/ns*pi*fn);
sr = (1-nn/ns);

PinR = (3*Un*In*PF);
eff  = Pn/PinR;

%Rated core losses (see Munoz-Garcia, Lipo, 1998, Trans IA, vol 34, no 4)
PcR  = PinR*(1-eff/(1-sr)) - 3*In^2*Rs;

Pnoload = PcR +3*In^2*Rs;

IactLosses = (0*PcR + 3*In^2*Rs)/Un/3;
% ____________________________________________________________________________________________


% --------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------

% fswitch          = 2e3;

% Rs               = 0;

% --------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------

%  Load parameters t_load=tq_const+k1*speed[rpm]+k2*speed[rpm]^2
% 
% jl=0.0;                                    %   load inertia moment [Nm^2]
% tq_const=0;                                %   constant load torque
% k1=0;                                      %   friction torque factor
% k2=13.73/(1445)^2;                         %   hydraulic torque factor


fs               = 5e3;