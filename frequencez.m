clear all; close all; clc;

% Given polynomial coefficients
b = [0.0056, 0.207, 1.33, 30.64];

% Calculate roots of the polynomial
poles = roots(b);

% Check stability
isStable = all(real(poles) < 0);

% Frequency response
[h, w] = freqz(b);

% Plot frequency response
figure;
subplot(2, 1, 1);
plot(w, abs(h));
title('Magnitude Response');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');

subplot(2, 1, 2);
plot(w, angle(h));
title('Phase Response');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');

% Display stability information
if isStable
    fprintf('Stability: Stable\n');
else
    fprintf('Stability: Unstable\n');
end
