%ANALYSIS OF DCM BOUNDARY CONDITIONS FOR NIBBB
% For BUCK
irrad =     [0.1    0.08    0.06    0.05    0.04    0.03    0.02    0.015   0.01    0.005];
P =         [26.37  20.47   14.64   11.76   8.93    6.14    3.45    2.64    1.01    0.25];
Vin =       [38.25  37.78   37.15   36.70   36.12   35.25   33.65   31.9    25.7    13.0];

Vout = 10: 1: 38;
D = zeros(size(P,2), size(Vout,2));
DCM = zeros(size(P,2), size(Vout,2));

T = 1/50e3;
L = 1.3e-3;
Ipv = P ./ Vin;

for i = 1 : size(P,2)
    for j = 1 : size(Vout,2)
        D(i,j) = Vout(j)/Vin(i);
    end
end

for i = 1 : size(P,2)
    for j = 1 : size(Vout,2)
        Iavg = Ipv(i) * D(i,j);
        Iripple = (Vin(i) - Vout(j)) * D(i,j) * T / L;
        DCM(i,j) = Iavg - (Iripple/2);
    end
end


DCM;

surf(Vout, P, DCM, 'FaceAlpha',0.6);

hold on

surf(Vout,P,zeros(size(P,2),size(Vout,2)),'FaceAlpha',0.9, 'EdgeColor', 'none');
title('DCM boudaries - Buck mode');

xlabel('Output voltage [V]');

%ylabel('PV power [W]');
ylabel('PV power [W]');


zlabel('Distance to DCM [A]');

hold off

