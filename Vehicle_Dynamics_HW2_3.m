m = 1000; k = 20000;
freq = logspace(-1 + log10(2 * pi), 2 * log10(2 * pi), 100); 

while freq(end) < 10^3
    freq = [freq, freq(end) * 10];
end

C_change = [0, 500, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000]; % c의 값 수정

figure(1);
for c = C_change
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
legend('c=0', 'c=500', 'c=1000', 'c=2000', 'c=3000', 'c=4000', 'c=5000', 'c=6000', 'c=7000', 'c=8000');

xlim([1e-1, 1e2]); % x축 범위 설정

figure(2);
for c = C_change 
    num = [c k 0 0];
    den = [m c k];
    
    sys = tf(num, den);
    
    % Bode 플롯 그리기
    bode(sys);
    hold on;
    grid on;
end
legend('c=0', 'c=500', 'c=1000', 'c=2000', 'c=3000', 'c=4000', 'c=5000', 'c=6000', 'c=7000', 'c=8000');

xlim([1e-1, 1e2]); % x축 범위 설정
