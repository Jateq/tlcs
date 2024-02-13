% Given transfer function coefficients
numerator = 29.64;
denominator = [0.0056, 0.207, 1.33, 30.64];

% Construct the transfer function
sys = tf(numerator, denominator);

% Simulate the step response
[y, t] = step(sys);

% Plot the step response
figure;
plot(t, y, 'LineWidth', 2);
title('Step Response of the System');
xlabel('Time');
ylabel('Amplitude');
grid on;

% Calculate quality indicators
info = stepinfo(sys);

% Display quality indicators
fprintf('Rise Time: %.4f seconds\n', info.RiseTime);
fprintf('Peak Time: %.4f seconds\n', info.PeakTime);
fprintf('Overshoot: %.2f%%\n', info.Overshoot);
fprintf('Settling Time: %.4f seconds\n', info.SettlingTime);
