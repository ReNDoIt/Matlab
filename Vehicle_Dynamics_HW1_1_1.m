%% Given Value
m = 1800; %[kg]
F = 4000; %[N]
v0 = 0; %[m/s]
%% Simulation time [sampling time set-up
t0 = 0;
t_end = 10;
SamplingTime = 0.001;

%% Initialization
% Define Initial Value
Fx = F;
velocity = 0;
acceleration = F/m; %2.22[m/s^2]
time = t0;
power = 0;

%% Simulation
for k = 1:t_end/SamplingTime % k:1,2,3~10000
    Fx(k+1) = Fx(k);
    time(k+1) = time(k) + SamplingTime;
    acceleration(k+1) = acceleration(k);
    velocity(k+1) = velocity(k) + acceleration(k)*SamplingTime;
    power(k+1) = Fx(k+1)*velocity(k+1);
end

%% Plot
figure(1)
subplot(121)
plot(time,velocity)
title('Time-Velocity graph'); grid on
xlabel('time[s]'); ylabel('velocity[m/s]');
subplot(122)
plot(time,power)
title('Time-Power graph'); grid on
xlabel('time[s]'); ylabel('Power[W]');
sgtitle('HW 1-1 Plot')