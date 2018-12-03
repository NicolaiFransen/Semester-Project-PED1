% LSRPM motor, 7kW

clear

Vs               = 360;           % [V], max. RMS phase voltage
Vph              = Vs*sqrt(2);    % [V], peak value, phase voltage

nrat             = 1750;          % [rpm], rate speed (shaft mechanical speed)

Npp              = 8/2;           % Number of pole pairs = 1/2 number of poles

Omegae_rat       = 2*pi*nrat/60*Npp;   
                                  % Rated electrical angular velocity

Lndmpm           = 0.412*1;       % [Web.turns], rotor peak PM flux linkage

J                = 1*1e-3;        % Motor inertia [J.m^2]

Trat             = 38;            % Rated torque 38 Nm.

Tl_const         = Trat/nrat^2;   % Fan load torque constants

% ____________________________________________________________________________________________


fs               = 10e3;          % switching frequency

% Initilizing the Simulink model
Omegae_ini       = 0;             % Initial motor shaft speed, electrical value, [rad/s]
Lndd_ini         = Lndmpm;        % This means at t=0, theta=0 and N-pole aligned with d-axis 

Omeg_const       = Omegae_rat;

Omegae           = 2*pi*5;

% --------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------

Rs               = 0.78;                           % [Om]
Lls              = 2e-3;                           % [H]
Ld               = 10e-3;                          % [H]
Lq               = 12.8e-3;                        % [H]

Lmd              = Ld-Lls;                         % [H]
Lmq              = Lq-Lls;                         % [H]

% _________________________________________________________________________
% Modify the inductance values
% Ld               = 70e-3;
% Lq               = Ld;
% _________________________________________________________________________


L1               = (Ld+Lq)/2;
L2               = (Ld-Lq)/2;

% _________________________________________________________________________
% Limiting the max. transient current in the output of speed loop PI
I_rated          = 16;            % Peak rated power
Iphmax           = I_rated*sqrt(2)*3;
% _________________________________________________________________________

% --------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------

switch 1
case 1
    
    % d-axis current PI parameters
    Ki2          = 550;
    Kp2          = 6;

    % q-axis current PI parameters
    Ki3          = 450;     
    Kp3          = 6;  

    
case 2   
end

% --------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------



