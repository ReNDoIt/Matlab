M = 400;
K = 20000;
C = 2000;
freq = logspace(log10(2*pi/10), 2*log10(2*pi*10^2+0.05), 100);

num = [C, K];
den = [M, C, K];
sys = tf(num, den);

num1 = [1];
den1 = [1];
sys1 = tf(num1, den1);

options = bodeoptions;
options.FreqUnits = 'Hz';

bodemag(sys, freq, options);
hold on;
bodemag(sys1, freq, options, 'r-');
grid on;

xlim([0.1, 100]); % 주파수 범위를 [0.1, 100] Hz로 설정
ylim([-50, 10]);

xlabel('Frequency [Hz]');
ylabel('Magnitude [dB]');

legend('With Suspension', 'Without Suspension');
