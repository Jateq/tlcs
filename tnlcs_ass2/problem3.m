clear; close all; clc;
syms a b c x1 x2;


eq1 = a*x1 - x1*x2;
eq2 = b*x1^2 - c*x2^2;


eq_points = solve(eq1 == 0, eq2 == 0, x1, x2);


a_val = 1;  
b_val = 2;  
c_val = 3;  

x1_values = double(subs(eq_points.x1, [a, b, c], [a_val, b_val, c_val]));
x2_values = double(subs(eq_points.x2, [a, b, c], [a_val, b_val, c_val]));


x1_str = sprintf('%f, ', x1_values);
x2_str = sprintf('%f, ', x2_values);


disp('Equilibrium points:');
disp(['x1: ', x1_str(1:end-2)]); 
disp(['x2: ', x2_str(1:end-2)]); 
