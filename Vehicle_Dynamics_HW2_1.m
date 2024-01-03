% 변수
A = 0.02;   % 진폭
k = 20000;  % 스프링 상수 (N/m)
m = 400;   % 차량 질량 (kg)
c = 2000;   % 댐핑 계수 (N*s/m)
g = 9.81;   % 중력 가속도 (m/s^2)

% 주파수 범위 설정 (0에서 4까지 0.02 간격)
frequency_range = 0:0.02:10;

% Bode 플롯 계산
w = 2 * pi * frequency_range;

% 차량이 내려가는 경우
num = A .* w.^2 .* sqrt(k^2 + (c * w).^2) + g * sqrt((k - m * w.^2).^2 + (c * w).^2);
den = sqrt((k - m * w.^2).^2 + (c * w).^2);
acceleration = num ./ den;

% 차량이 올라가는 경우
num2 = (-1) * A .* w.^2 .* sqrt(k^2 + (c * w).^2) + g * sqrt((k - m * w.^2).^2 + (c * w).^2);
den2 = sqrt((k - m * w.^2).^2 + (c * w).^2);
acceleration2 = num2 ./ den2;

% 차량이 서스펜션 없이 내려가는 경우
num3 = A .* w.^2 + g; 
den3 = 1;
acceleration3 = num3 ./ den3;

% 차량이 서스펜션 없이 올라가는 경우
num4 = (-1) * A .* w.^2 + g;
den4 = 1;
acceleration4 = num4 ./ den4;

% Bode 플롯 그리기
figure;
plot(frequency_range, acceleration/10);
grid on;
title('Bode Plot: Max Acc [G] by Frequency');
xlabel('Frequency (Hz)');
ylabel('Maximum Acceleration [G]');
xlim([0 10]);  % x축 범위 설정
ylim([-10 15]);  % y축 범위 설정
hold on

plot(frequency_range, acceleration2/10);
plot(frequency_range, acceleration3/10);
plot(frequency_range, acceleration4/10);
legend('Suspension Down', 'Suspension Up', 'No Suspension Down', 'No Suspension Up');
