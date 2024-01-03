% 차량 파라미터
b = 1.14; % 뒷바퀴에서 물체 중심까지의 거리 (m)
c = 1.40; % 물체 중심에서 앞바퀴까지의 거리 (m)
m = 1500; % 차량 질량 (kg)
Iz = 2420; % 차량 좌우 회전 관성 모멘트 (kg*m^2)
Car = 2 * 44000; % 앞바퀴에 작용하는 코너링 스프링 상수 (N/rad)
Caf = 2 * 47000; % 뒷바퀴에 작용하는 코너링 스프링 상수 (N/rad)
u = 20; % 차량 속도 (m/s)
L = b+c;
g=9.81;

% 시뮬레이션 파라미터
t = 0:0.01:10; % 시간 범위 (초)

% 코너링 입력 생성
U = 0.5 *pi/180 * sin(t); %rad/sec
% State space Vector
A=[-(Caf+Car)/(m*u), (c*Car-b*Caf)/(m*u)-u
  (c*Car-b*Caf)/(Iz*u), -(b^2 * Caf+ c^2 * Car)/(Iz*u)];
B=[Caf/m ; b*Caf/Iz];
C_lat=[1 0]; D_lat=0; %lateral Speed
C_yaw=[0 1]; D_yaw=0; %Yaw rate
C_acc=A(1,:);  % +u*[0 1]; 교재에는 u[0 1] 더해주는데 이는 u*r을 뜻함...왜지?
D_acc=B(1); %Lateral accel
C=[C_lat;C_yaw;C_acc];
D=[D_lat;D_yaw;D_acc];

Y=lsim(A,B,C,D,U,t);
subplot(221), plot(t,U*180/pi, 'r-d');grid
xlabel('time(sec)') ,ylabel('Steering (deg)')
subplot(222), plot(t,Y(:,1),'r-d');grid
xlabel('time(sec)') ,ylabel('Lateral Velocity(m/sec)')
subplot(223), plot(t,Y(:,2)*180/pi,'r-d');grid %degree표시
xlabel('time(sec)'),ylabel('Yaw rate(deg/sec)')
subplot(224), plot(t,Y(:,3), 'r-d');grid
xlabel('time(sec)'), ylabel('Lat. Accel. (m/sec 2)')
