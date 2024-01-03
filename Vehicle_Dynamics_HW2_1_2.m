M = 400;
K = 20000;
C = 2000;
freq = logspace(log10(2 * pi / 10), 2 * log10(2 * pi * 10^2 + 0.05), 100);

num = [C, K, 0, 0];
den = [M, C, K]; 
sys = tf(num, den);

num1 = [1, 0, 0]; 
den1 = [1];
sys1 = tf(num1, den1);

options = bodeoptions;
options.FreqUnits = 'Hz';

bodemag(sys, freq, options);
hold on;
bodemag(sys1, freq, options, 'r-');
grid on;

xlim([0.1, 100]);
ylim([-20, 120]); 

title('Vertical Acceleration');

xlabel('Frequency [Hz]');
ylabel('[X/U] [dB]');

legend('With Suspension', 'Without Suspension');
