
csv_data = csvread('softwarefiltercurrent.csv',1,0);


time = csv_data(:,1);
filtered_signal = csv_data(:,2);
raw_signal = csv_data(:,3);

figure(1)
plot(time, raw_signal)
hold on
plot(time, filtered_signal,'.', 'MarkerSize', 10)
ylim([7 10.5])
xlim([0 0.3])
hold off
