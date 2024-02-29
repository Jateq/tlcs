clear; close all; clc;

numerator = 1;
denominator = [1 3 2 0]; 

G = tf(numerator, denominator);


[A, B, C, D] = tf2ss(numerator, denominator);



p1 = -2 + 2*sqrt(3)*1i;
p2 = conj(p1);
p3 = -10;

desired_poles = [p1,p2,p3];

disp([p1; p2; p3]);

K = place(A, B, desired_poles);


disp('The state feedback gain K is:');
disp(K);
