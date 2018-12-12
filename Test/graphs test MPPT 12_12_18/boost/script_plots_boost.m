clc 
clear all 

MPPT1000_boost = csvread('200irr.csv',1,0);

t1000_boost = MPPT1000_boost(:,1);
vin1000_boost = MPPT1000_boost(:, 2);
iin1000_boost = MPPT1000_boost(:, 3);
vout1000_boost = MPPT1000_boost(:, 4);
iout1000_boost = MPPT1000_boost(:, 5);

pin1000_boost = vin1000_boost.* iin1000_boost;
pout1000_boost = vout1000_boost.* iout1000_boost;

vinfilter_boost = smoothdata(vin1000_boost);
voutfilter_boost = smoothdata(vout1000_boost);
pinfilter_boost = smoothdata(pin1000_boost);
poutfilter_boost = smoothdata(pout1000_boost);

figure(1)
plot(t1000_boost, vin1000_boost)
hold all
plot(t1000_boost, iin1000_boost)
plot(t1000_boost, vinfilter_boost, 'LineWidth',2)

figure(2)
plot(t1000_boost, pin1000_boost)
hold on 
plot(t1000_boost, pinfilter_boost, 'LineWidth',2)

figure(3)
plot(t1000_boost, vout1000_boost)
hold all
plot(t1000_boost, vin1000_boost)
plot(t1000_boost, vinfilter_boost, 'LineWidth',2)
plot(t1000_boost, voutfilter_boost, 'LineWidth',2)



figure(4)
plot(t1000_boost, pin1000_boost)
hold all
plot(t1000_boost, pout1000_boost)
plot(t1000_boost, pinfilter_boost, 'LineWidth',2)
plot(t1000_boost, poutfilter_boost, 'LineWidth',2)
