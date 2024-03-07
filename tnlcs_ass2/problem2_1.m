close all; clear; clc

syms x1 x2;
eq1 = x2;
eq2 = -x1 + (x1^3)/6 - x2;
eq_points = solve(eq1 == 0, eq2 == 0, x1, x2);
disp('Equilibrium points:');
disp(eq_points.x1);
disp(eq_points.x2);

fsdds