 mu=36;
ks = 16000; kt=160000; bs=980;

freq = logspace(-2 + log10(2 * pi), 3, 1000);  % Frequencies in Hz (from 0.01 Hz to 10^3 Hz)

M_change = [120, 240, 480]; % c의 값 수정


for i = 1:length(M_change)
    figure(i);
    ms= M_change(i);
    num = [bs * kt, ks * kt, 0];
    den = [ms * mu, (mu + ms) * bs, ((ms + mu) * ks + ms * kt), kt * bs, ks * kt];
    
    sys = tf(num, den);
    options = bodeoptions;
    options.FreqUnits = 'rad/s'; % Set frequency units to rad/s
    options.MagUnits = 'abs';    % Set magnitude units to absolute value
    options.YLimMode = 'manual'; % Manually set y-axis limits
    options.YLim = [0, 10];     % Set the desired y-axis limits
    
    % Bode 플롯 그리기 with different line styles
    if ks == 800
        bodemag(sys, freq, '-.r', options);
    elseif ks == 1000
        bodemag(sys, freq, '--k', options);
    else
        bodemag(sys, freq, options);
    end
    
    
    grid on;
    legend('k=100,000', 'kt=500,000', 'kt=1,000,000');
xlim([0.1, 1e3]); % Set the desired x-axis range
set(gca, 'XScale', 'log'); % Set x-axis to logarithmic scale

ylim([0.01, 1e4]); % Set the desired x-axis range
set(gca, 'YScale', 'log'); % Set y-axis to logarithmic scale
end

legend('k=100,000', 'kt=500,000', 'kt=1,000,000');
xlim([0.1, 1e3]); % Set the desired x-axis range
set(gca, 'XScale', 'log'); % Set x-axis to logarithmic scale

ylim([0.01, 1e4]); % Set the desired x-axis range
set(gca, 'YScale', 'log'); % Set y-axis to logarithmic scale
