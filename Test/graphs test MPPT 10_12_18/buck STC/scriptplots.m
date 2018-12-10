%%  
MPPT1000 = csvread('tek0001CH1.csv',1,0);

t1000 = MPPT1000(:,1);
i1000 = MPPT1000(:, 2);

plot(t1000, i1000)

%% 
MPPT1000 = csvread('voltages_currents_ALL.csv',1,0);

t1000 = MPPT1000(:,1);
vin1000 = MPPT1000(:, 2);
iin1000 = MPPT1000(:, 3);
vout1000 = MPPT1000(:, 4);
iout1000 = MPPT1000(:, 5);

pin1000 = vin1000.* iin1000;
pout1000 = vout1000.* iout1000;

figure(1)
plot(t1000, vin1000)
hold on
plot(t1000, iin1000)

figure(2)
plot(t1000, pin1000)

figure(3)
plot(t1000, vout1000)
hold on
plot(t1000, vin1000)

figure(4)
plot(t1000, pin1000)
hold on
plot(t1000, pout1000)

