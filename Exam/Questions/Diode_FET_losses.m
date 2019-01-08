I = 0:1:60;

Pd = 0.7 * I;
Pm = 20e-3 * I.^2;

plot(Pd, 'LineWidth', 3, 'color', 'b');
hold on
plot(Pm, 'LineWidth', 3, 'color', 'r');
legend('Diode losses','MOSFET losses');
%title('Coil inductance under current flow (50kHz)');
xlabel('I [A]');
ylabel('P [W]');