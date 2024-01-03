m = 800; c = 2000;
freq = logspace(-1 + log10(2 * pi), 2 * log10(2 * pi), 100); 

while freq(end) < 10^3
    freq = [freq, freq(end) * 10];
end

K_change = [0, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000];

figure(1);
for k = K_change
    num = [c k 0 0];
    den = [m c k];
    
    sys = tf(num, den);
    options = bodeoptions;
    options.FreqUnits = 'Hz';
    
    % Bode 플롯 그리기
    bodemag(sys, freq, options);
    hold on;
    grid on;
end
legend('k=0', 'k=10000', 'k=20000', 'k=30000', 'k=40000', 'k=50000', 'k=60000', 'k=70000', 'k=80000');

xlim([1e-1, 1e2]); % x축 범위 설정

figure(2);
for k = K_change
    num = [c k 0 0];
    den = [m c k];
    
    sys = tf(num, den);
    
    % Bode 플롯 그리기
    bode(sys);
    hold on;
    grid on;
end
legend('k=0', 'k=10000', 'k=20000', 'k=30000', 'k=40000', 'k=50000', 'k=60000', 'k=70000', 'k=80000');
xlim([1e-1, 1e2]); % x축 범위 설정
