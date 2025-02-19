% clc;
% clear all;

f = 50000; %20000:10000:100000;  %100kHZ
V_inverter = 360; 
n_mics = 4:1:15;
Vmpp = 36.9; %36.25V is voltage obtained during simulation for a 400W/m3 irradiance and 25�C (P = 117W).
Impp = 8.14; %3.23A is current obtained during simulation for a 400W/m3 irradiance and 25�C (P = 117W).

Iin = Impp;
Vin = Vmpp;  
Vout = V_inverter./n_mics; 
P = Vmpp*Impp

percent_ripple_IL = 0.1;
percent_ripple_C_out = 0.005; %0.5% voltage ripple at the output (really Vout is controlled by the inverter).
percent_ripple_C_in = 0.001;  %0.1% voltage ripple at the input in order to maintain MPP conditions.

M = Vout./Vin; 
C_in = zeros(size(f,2),size(n_mics,2));
C_out = zeros(size(f,2),size(n_mics,2));
L = zeros(size(f,2),size(n_mics,2));

for i = 1:size(M,2)
    if (M(i) < 1) %Buck 
        D2 = 0; 
        D1 = Vout(i)/Vin; 
        Iout = P/Vout(i); 

        %Current through inductor: 
        IL_avg = Iout; %From eq. 4
        ripple_IL = percent_ripple_IL * IL_avg;   %Inductor current ripple is 10% the average current through inductor
        L(:,i) = (Vin*D1*(1-D1))./(ripple_IL .*f);  %From eq. 5

        %Voltage through output capacitor: 

        ripple_Vout = percent_ripple_C_out * Vout(i);  % Output voltage ripple 1% of Vout.
        C_out(:,i) = Vout(i) * (1-D1) ./ (8.*L(:,i)'.*f.^2.*ripple_Vout); 

        %Voltage through input capacitor

        ripple_Vin = percent_ripple_C_in * Vin;  %input voltage ripple 1% of Vin
        C_in(:,i) = Iin * (1 - D1) / (ripple_Vin * f);%(Vin - Vout(i))./(ripple_Vin .* 0.0013) .* (Vout(i)./(Vin .* f)).^2;

    
    else %Boost
        D2 = (Vout(i) - Vin) ./ Vout(i); 
        D1 = 1; 
        Iout = P ./ Vout(i); 

        %Current through inductor: 
        IL_avg = 1 ./ (1 - D2) .* Iout; %From eq. 4
        ripple_IL = percent_ripple_IL * IL_avg;   %Inductor current ripple is 10% the average current through inductor
        L(:,i) = (Vin .* D2) ./ (ripple_IL .* f');  %From eq. 5

        %Voltage through output capacitor: 
        ripple_Vout = percent_ripple_C_out * Vout(i);  % Output voltage ripple 1% of Vout.
        C_out(:,i) = Iout * D2 /(ripple_Vout * f);%((Vout(i) - Vin) ./ (ripple_Vout .* 1.3e-3)) * (Vin ./ (Vout(i) .* f)).^2;%D2 .* Iout ./ (f' .* ripple_Vout); 

        %Voltage through input capacitor
        ripple_Vin = percent_ripple_C_in * Vin;  %input voltage ripple 1% of Vin
        C_in(:,i) = (Iout .* D2 .* (1-D2)) ./ (ripple_Vin .* f');
    end
end

