% 차량 파라미터
b = 1.14; % 뒷바퀴에서 물체 중심까지의 거리 (m)
c = 1.40; % 물체 중심에서 앞바퀴까지의 거리 (m)
m = 1000; % 차량 질량 (kg)
Iz = 1200; % 차량 좌우 회전 관성 모멘트 (kg*m^2)
Car = 2056 * 180/pi; % 앞바퀴에 작용하는 코너링 스프링 상수 (N/rad)
Caf = 2400 * 180/pi; % 뒷바퀴에 작용하는 코너링 스프링 상수 (N/rad)
u_value = [5 : 0.1 : 40]; % 차량 속도 (m/s)
L = b + c;
g = 9.81;

% 초기화
V_response = zeros(size(u));

% 차량 속도에 대한 횡방향 속도 반응 계산
for i = 1:length(u_value)
    u=u_value(i);
    A = [-(Caf + Car)/(m*u), (c*Car - b*Caf)/(m*u) - u
        (c*Car - b*Caf)/(Iz*u), -(b^2 * Caf + c^2 * Car)/(Iz*u)];
    B = [Caf/m; b*Caf/Iz];
    y = -inv(A)* B *(pi/180);
    V_response(i) = y(1);
    
end
% 결과 플로팅
figure;
plot(u_value, V_response, 'red', 'LineWidth', 2);
title('차량 속도에 대한 횡방향 속도 반응');
xlabel('차량 속도 (m/s)');
ylabel('횡방향 속도 (m/s)');
grid on;
