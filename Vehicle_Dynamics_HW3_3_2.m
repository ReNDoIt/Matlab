ms = 240; mu = 36;
ks = 16000; kt = 160000;

freq = logspace(-2 + log10(2 * pi), 3, 1000);  % Frequencies in Hz (from 0.01 Hz to 10^3 Hz)

C_change = [196, 980,3920]; % c의 값 수정

figure(1);
for i = 1:length(C_change)
    bs = C_change(i);
    num = [-1*kt*ms , 0 ];
    den = [ms * mu, (mu + ms) * bs, ((ms + mu) * ks + ms * kt), kt * bs, ks * kt];
    
    sys = tf(num, den);
    options = bodeoptions;
    options.FreqUnits = 'rad/s'; % Set frequency units to rad/s
    options.MagUnits = 'abs';    % Set magnitude units to absolute value
    options.YLimMode = 'manual'; % Manually set y-axis limits
    options.YLim = [0, 10];     % Set the desired y-axis limits
    
    % Bode 플롯 그리기 with different line styles
    if bs == 196
        bodemag(sys, freq, '-.r', options);
    elseif bs == 980
        bodemag(sys, freq, '--k', options);
    else
        bodemag(sys, freq, options);
    end
    
    hold on;
    grid on;
end

legend('c=196', 'c=980', 'c=3920');
xlim([0.1, 1e3]); % Set the desired x-axis range
set(gca, 'XScale', 'log'); % Set x-axis to logarithmic scale

ylim([0.0001, 1e1]); % Set the desired x-axis range
set(gca, 'YScale', 'log'); % Set y-axis to logarithmic scale
