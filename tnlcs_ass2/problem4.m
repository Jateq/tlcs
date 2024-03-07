clear; clc; close all;
syms x1 x2 u K;

% Define the system equations
eq1 = (u - x1)*(1 + x2^2);
eq2 = (x1 - 2*x2)*(1 + x1^2);

% Substitute the feedback control law u = -Ky
eq1 = subs(eq1, u, -K*x2);
eq2 = subs(eq2, u, -K*x2);

% Solve for the equilibrium points
eq_points = solve(eq1 == 0, eq2 == 0, x1, x2);

% Display the equilibrium points for all values of K
for i = 1:length(eq_points.x1)
    disp(['Equilibrium point for K = ', num2str(i), ':']);
    disp(['x1: ', num2str(double(eq_points.x1(i)))]);
    disp(['x2: ', num2str(double(eq_points.x2(i)))]);
end
