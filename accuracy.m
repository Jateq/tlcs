% Given transfer function coefficients
numerator = 29.64;
denominator = [0.0056, 0.207, 1.33, 30.64];

% Construct the transfer function
sys = tf(numerator, denominator);

% Assessing accuracy - Example assessments
% Feel free to customize based on your specific requirements

% Steady-State Error
steadyStateError = dcgain(sys);

% Transient Response Analysis
stepInfoResults = stepinfo(sys);

% Stability Analysis
[~, ~, poles] = margin(sys);

% Frequency Response Analysis
figure;
bode(sys);
grid on;

% Display results
fprintf('Steady-State Error: %.4f\n', steadyStateError);
fprintf('Rise Time: %.4f seconds\n', stepInfoResults.RiseTime);
fprintf('Overshoot: %.2f%%\n', stepInfoResults.Overshoot);

% Check the stability of the system
if all(real(poles) < 0)
    fprintf('Stability Margin: Stable\n');
else
    fprintf('Stability Margin: marginally stable\n');
end
