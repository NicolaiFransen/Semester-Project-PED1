MPPT1000_boost = csvread('voltages_currents_boost.csv',1,0);

t1000_boost = MPPT1000_boost(:,1);
vin1000_boost = MPPT1000_boost(:, 2);
iin1000_boost = MPPT1000_boost(:, 3);
vout1000_boost = MPPT1000_boost(:, 4);
iout1000_boost = MPPT1000_boost(:, 5);

pin1000_boost = vin1000_boost.* iin1000_boost;
pout1000_boost = vout1000_boost.* iout1000_boost;

vinfilter_boost = smoothdata(vin1000_boost);

figure(1)
plot(t1000_boost, vin1000_boost)
hold all
plot(t1000_boost, iin1000_boost)
plot(t1000_boost, vinfilter_boost)

figure(2)
plot(t1000_boost, pin1000_boost)

figure(3)
plot(t1000_boost, vout1000_boost)
hold on
plot(t1000, vin1000)

figure(4)
plot(t1000_boost, pin1000_boost)
hold on
plot(t1000_boost, pout1000_boost)

