clear; close all; clc;
num = 1;
den = [1 12 20];
G = tf(num, den);

% coeff
Kp = 787.76;
Ki = 2623.54;
Kd = 48.29;


% PID controller
C = pid(Kp, Ki, Kd);

% Applying PID controller to the plant
sys_cl = feedback(C * G, 1);

% Plot
figure;
step(sys_cl);
title('Step Response of Closed-Loop System');
grid on;

% Calculate settling time and overshoot
info = stepinfo(sys_cl);
settling_time_actual = info.SettlingTime;
overshoot_actual = info.Overshoot;

fprintf('Actual Settling Time: %.2f seconds\n', settling_time_actual);
fprintf('Actual Overshoot: %.2f%%\n', overshoot_actual);
