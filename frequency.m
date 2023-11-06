clear all; close all; clc;

%% Sinusoidal input

K = 5;
tau = 0.6;
sys = tf(K, [tau 1]);

% Define the input u(t) = a * sin (omega * t)
A = 1;
omega = 1;

tt = linspace(0, 30, 200); % here, 0 is start time, 30 = endtime, 200 = number of points

u = A * sin (omega * tt);

% LSIM command to simulate the linear system

y = lsim(sys, u, tt);

title("Frequency response of the system to the sinusoidal input")

plot(tt, u, "r-.", "LineWidth", 2)
hold on
plot(tt, y, "b-.", "LineWidth",2)
ylim([-5 5])
xlabel("Time (s)", "FontSize", 18)
ylabel("Magnitude", "FontSize", 18)
legend("Input u(t)", "Output y(t)", "FontSize",18)
