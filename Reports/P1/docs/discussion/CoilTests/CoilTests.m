char_old_coil_50kHz = [
    0 0.5 1 2 3 4 5 6 7 8 9 10 15;% 20 ;
    1012 926 825 615 447 328 249 194 156 128 107 92 51;% 36;
    3.2 2.3 1.9 1.17 0.74 0.5 0.37 0.29 0.23 0.2 0.18 0.17 0.14];% 0.13];

char_new_coil_50kHz = [
    0 0.5 1 2 3 4 5 6 7 8 9 10 15;% 20;
    1930 1928 1923 1914 1903 1890 1875 1860 1841 1821 1797 1772 1601;% 1373;
    2.3 2.3 2.2 2.1 2.1 2.1 2.1 2.1 2 2 2 2 1.7];% 1.4];

plot(char_old_coil_50kHz(1,:), char_old_coil_50kHz(2,:), 'LineWidth', 3, 'color', 'b');
hold on
plot(char_new_coil_50kHz(1,:), char_new_coil_50kHz(2,:), 'LineWidth', 3, 'color', 'r');
legend('Old inductor','New inductor');
%title('Coil inductance under current flow (50kHz)');
xlabel('I [A]');
ylabel('L [uH]');