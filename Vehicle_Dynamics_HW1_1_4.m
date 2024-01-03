%% Given Value
% Vehicle mass : m = 1800 [kg]
% Rolling resistance coefficient : f = 0.02
% Drag coefficient : Cd = 0.4
% Air density : rho = 1.202 [kg/m^3]
% Vehicle cross-section area : A = 2 [m^2]
% theta=0.04 [rad]
clc, clear all, close all;
m = 1800; % [kg]
theta=0.04; % [rad]
F = 4000; % [N]
v0 = 0; % [m/s]
f = 0.02;
Cd = 0.4;
rho = 1.202; % [kg/m^3]
A = 2; % [m^2]
g = 9.81; % [m/s^2]

%% Sampling time set-up
t0 = 0; % [sec]
t1 = 25; % [sec]
Samplingtime = 0.001;

%% Simulation
%Q1-4
Fx = 4000; % Tractive force[N]
Rx = f*m*g; % Rolling resistance[N]
Wtheta = m*g*theta; %Gravity force by road grades
velocity = 0;
Da = (1/2)*rho*(velocity^2)*Cd*A; % Aerodynamic force[N]
acceleration = 0;
time = 0;
power =0;
[t, y] = ode45(@ODE_1_4, [0 25], [0 ; 0]);
power=Fx*y(:,2);
power(power>100000) = 100000;
y(y>25)=25;

%% Plot
figure(1)
subplot(121)
plot(t, y(:,2)); % y(2) = velocity
hold on; grid
xlabel('time[s]');
ylabel('velocity[m/s]');
title('Velocity per time');
subplot(122)
plot(t,power)
title('Power'); grid on
xlabel('time[s]'); ylabel('power');
sgtitle('HW 1-4 Plot')
