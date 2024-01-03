ms = 240; mu = 36;
kt = 160000; bs=980;

freq = logspace(-2 + log10(2 * pi), 3, 1000);  % Frequencies in Hz (from 0.01 Hz to 10^3 Hz)

Ks_change = [4000, 16000, 64000]; % ks의 값 수정

figure(1);
for i = 1:length(Ks_change)
    ks = Ks_change(i);
    num = [bs * kt, ks * kt, 0];
    den = [ms * mu, (mu + ms) * bs, ((ms + mu) * ks + ms * kt), kt * bs, ks * kt];
    
    sys = tf(num, den);
    options = bodeoptions;
    options.FreqUnits = 'rad/s'; % Set frequency units to rad/s
    options.MagUnits = 'abs';    % Set magnitude units to absolute value
    options.YLimMode = 'manual'; % Manually set y-axis limits
    options.YLim = [0, 10];     % Set the desired y-axis limits
    
    % Bode 플롯 그리기 with different line styles
    if ks == 4000
        bodemag(sys, freq, '-.r', options);
    elseif ks == 16000
        bodemag(sys, freq, '--k', options);
    else
        bodemag(sys, freq, options);
    end
    
    hold on;
    grid on;
end

legend('ks=4,000', 'ks=16,000', 'ks=64,000');
xlim([0.1, 1e3]); % Set the desired x-axis range
set(gca, 'XScale', 'log'); % Set x-axis to logarithmic scale

ylim([0.01, 1e2]); % Set the desired x-axis range
set(gca, 'YScale', 'log'); % Set y-axis to logarithmic scale
