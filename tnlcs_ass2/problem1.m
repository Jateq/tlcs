close all; clear; clc

% Equation (a): y' = y^2 - y - 6
syms y;
eqn_a = y^2 - y - 6;
eq_sol_a = solve(eqn_a == 0, y);
disp('Equilibrium solutions for y'' = y^2 - y - 6:');
disp(eq_sol_a);

% Equation (b): y' = (y^2 - 4)(y + 1)^2
eqn_b = (y^2 - 4)*(y + 1)^2;
eq_sol_b = solve(eqn_b == 0, y);
disp('Equilibrium solutions for y'' = (y^2 - 4)(y + 1)^2:');
disp(eq_sol_b);
