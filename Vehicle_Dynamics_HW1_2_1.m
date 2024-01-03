%% Given Value
% Vehicle mass : m = 1800 [kg]
% Rolling resistance coefficient : f = 0.02
% Drag coefficient : Cd = 0.4
% Air density : rho = 1.202 [kg/m^3]
% Vehicle cross-section area : A = 2 [m^2]
clc, clear all, close all;
m = 1800; % [kg]
F = -2000; % [N]
v0 = 13.8889; % [m/s] = 50[km/h] 
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
%Q1-3
m=1800;
Fx = -2000; % Tractive force[N]
Rx = f*m*g; % Rolling resistance[N]
velocity = 13.8889;
Da = (1/2)*rho*(velocity^2)*Cd*A; % Aerodynamic force[N]
acceleration = 0;
time = 0;
[t, y] = ode45(@ODE_2_1, [0 : 0.01 :20], [0 ; 13.8889]);


%% Plot
figure(1)
subplot(121)
plot(t, y(:,2)); % y(2) = velocity
hold on; grid
xlabel('time[s]');
ylabel('velocity[m/s]');
title('Velocity per time');
axis([0,20,0,20]);
