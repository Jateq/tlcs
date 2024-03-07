clear; close all; clc;

numerator = 1;
denominator = [1 3 2 0]; 

H = tf(numerator, denominator);
G = feedback(H,1);

[A, B, C, D] = tf2ss(G);



p1 = -2 + 2*sqrt(3)*1i;
p2 = conj(p1);
p3 = -10;

desired_poles = [p1,p2,p3];

disp([p1; p2; p3]);

K = place(A, B, desired_poles);


disp('The state feedback gain K is:');
disp(K);
