ms = 240; mu = 36;
bs = 980;

freq = logspace(-2 + log10(2 * pi), 3, 1000);  % Frequencies in Hz (from 0.01 Hz to 10^3 Hz)

Ks_change = [4000, 16000, 64000]; % ks의 값 수정
Kt_change = [128000, 160000, 192000];

figure(1);
for j = 1:length(Kt_change)
    kt = Kt_change(j);
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
            if kt==128000
                bodemag(sys,freq,'-.k',options);
            end
            if kt==160000
                bodemag(sys, freq, '-.r', options);
            end
            if kt==192000
                bodemag(sys,freq,'-.b',options);
            end
        elseif ks == 16000
            if kt==128000
                bodemag(sys,freq,'--k',options);
            end
            if kt==160000
                bodemag(sys, freq, '--r', options);
            end
            if kt==192000
                bodemag(sys,freq,'--b',options);           
            end
        elseif ks == 64000
            if kt==128000
                bodemag(sys,freq,'k',options);
            end
            if kt==160000
                bodemag(sys, freq, 'r', options);
            end
            if kt==192000
                bodemag(sys,freq,'b',options);             
            end
        end
    
        hold on;
        grid on;
    end
end

legend('Kt=128,000, Ks=4,000', 'Kt=128,000, Ks=16,000', 'Kt=128,000, Ks=64,000', ...
       'Kt=160,000, Ks=4,000', 'Kt=160,000, Ks=16,000', 'Kt=160,000, Ks=64,000', ...
       'Kt=192,000, Ks=4,000', 'Kt=192,000, Ks=16,000', 'Kt=192,000, Ks=64,000');

xlim([0.1, 1e3]); % Set the desired x-axis range
set(gca, 'XScale', 'log'); % Set x-axis to logarithmic scale

ylim([0.01, 1e2]); % Set the desired x-axis range
set(gca, 'YScale', 'log'); % Set y-axis to logarithmic scale