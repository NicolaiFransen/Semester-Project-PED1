%Duty cycle and conversion ratio M analysis 

duty_cycle_0_to_1 = 0:0.01:1;
duty_cycle_0_to_05 = 0.05:0.01:0.5;
duty_cycle_05_to_1 = 0.5:0.01:0.95;
duty_cycle_005_to_045 = 0.05:0.01:0.45;

%M_buck = arrayfun(buck_evaluation, duty_cycle)
%M_boost = arrayfun(boost_evaluation, duty_cycle)
%M_Buckboost = arrayfun(buckboost_evaluation, duty_cycle)

M_buck = buck_evaluation(duty_cycle_0_to_05)
M_boost = boost_evaluation(duty_cycle_05_to_1)
%M_buckboost_single_d = single_d_buckboost_evaluation(duty_cycle_0_to_1)
%M_buckboost_double_d = double_d_buckboost_evaluation(duty_cycle_005_to_045)

figure(1)
plot(duty_cycle_05_to_1, M_boost, 'Linewidth',1)
hold on
plot(duty_cycle_0_to_05, M_buck,'Linewidth',1)
ylim([0 10])
xlabel('Duty Cycle')
ylabel('Vout/Vin')
legend('Boost Mode','Buck Mode')
%hold on
%plot(duty_cycle_005_to_045, M_buckboost_double_d)
%hold on
%plot(duty_cycle_0_to_1, M_buckboost_single_d)
%axis([0 0.90 0 5])
hold off

M_buck_single = buck_evaluation_single(duty_cycle_0_to_1)
M_boost_single = boost_evaluation_single(duty_cycle_0_to_1)

figure(2)
plot(duty_cycle_0_to_1, M_buck_single,'r','Linewidth',1)
hold on
plot(duty_cycle_0_to_1, M_boost_single, 'b', 'Linewidth',1)
ylim([0 10])
xlabel('Duty Cycle')
ylabel('Vout/Vin')
legend('Boost Mode','Buck Mode')

function y = buck_evaluation(x)
y = x*2;
end

function y = boost_evaluation(x)
y = 1 ./ (1 - (2*x-1))
end

function y = buck_evaluation_single(x)
y = x;
end

function y = boost_evaluation_single(x)
y = 1 ./ (1 - x)
end

function y = single_d_buckboost_evaluation(x)
y = x ./ (1 - x)
end

function y = double_d_buckboost_evaluation(x)
y = 0.8 ./ (1 - x)
end

