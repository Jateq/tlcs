% Given transfer function coefficients
numerator = 29.64;
denominator = [0.0056, 0.207, 1.33, 30.64];

% Construct the transfer function
sys = tf(numerator, denominator);

% Frequency Response Analysis (Bode Plot)
figure;
bode(sys);
grid on;

% Stability Analysis
[~, phaseMargin, gainMargin, bandwidth] = margin(sys);

% Display results
fprintf('Phase Margin: %.2f degrees\n', phaseMargin);
fprintf('Gain Margin: %.2f dB\n', 20*log10(gainMargin));
fprintf('Bandwidth: %.4f rad/s\n', bandwidth);
