clc 
clear all 

f = 50000:50000:1000000;  %100kHZ
V_inverter = 360; 
n_mics = 4:2:24;
P = 300; 
Vmpp = 32.6;
Impp = 9.21; 
K = Vmpp/Impp; 
Iin = sqrt(P/K);
Vin = K * Iin;  
Vout = V_inverter./n_mics; 

percent_ripple_IL = 0.1;
percent_ripple_C_out = 0.01;
percent_ripple_C_in = 0.01;

M = Vout/Vin; 

if M<0.75 %Buck 
    D2 = 0; 
    D1 = Vout/Vin; 
    Iout = P/Vout; 
    
    %Current through inductor: 
    IL_avg = Iout; %From eq. 4
    ripple_IL = percent_ripple_IL * IL_avg;   %Inductor current ripple is 10% the average current through inductor
    L = (Vin*D1*(1-D1))/(ripple_IL *f);  %From eq. 5
    
    %Voltage through output capacitor: 
    
    ripple_Vout = percent_ripple_C_out * Vout;  % Output voltage ripple 1% of Vout.
    C_out = Vin/(8*L*f^2*ripple_Vout); 
    
    %Voltage through input capacitor
    
    ripple_Vin = percent_ripple_C_in * Vin;  %input voltage ripple 1% of Vin
    C_in = (Iout * D1*(1-D1))/(ripple_Vin *f);

elseif M<1.25 %Buck-boost
    D1 = Vout / (Vin + Vout); 
    D2 = D1; 
    Iout = P/Vout; 
    
    %Current through inductor: 
    IL_avg = 1/(1-D1) * Iout; %From eq. 4
    ripple_IL = percent_ripple_IL * IL_avg;   %Inductor current ripple is 10% the average current through inductor
    L = (Vin*D1)./(ripple_IL *f);  %From eq. 5
    
    %Voltage through output capacitor: 
    ripple_Vout = percent_ripple_C_out * Vout;  % Output voltage ripple 1% of Vout.
    C_out = (D1 * Iout) ./ (f * ripple_Vout); 
    
    %Voltage through input capacitor
    ripple_Vin = percent_ripple_C_in * Vin;  %input voltage ripple 1% of Vin
    C_in = (Iout * D1*(1-D1)) ./ (ripple_Vin * f);
else %Boost
    D2 = (Vout - Vin) ./ Vout; 
    D1 = 1; 
    Iout = P ./ Vout; 
    
    %Current through inductor: 
    IL_avg = 1 ./ (1 - D2) .* Iout; %From eq. 4
    ripple_IL = percent_ripple_IL * IL_avg;   %Inductor current ripple is 10% the average current through inductor
    L = (Vin .* D2) ./ (ripple_IL .* f');  %From eq. 5
    
    %Voltage through output capacitor: 
    ripple_Vout = percent_ripple_C_out * Vout;  % Output voltage ripple 1% of Vout.
    C_out = D2 .* Iout ./ (f' .* ripple_Vout); 
    
    %Voltage through input capacitor
    ripple_Vin = percent_ripple_C_in * Vin;  %input voltage ripple 1% of Vin
    C_in = (Iout .* D2 .* (1-D2)) ./ (ripple_Vin .* f');
end

