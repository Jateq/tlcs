function [L, q_dot] = modal_sys(A,B,C)
% eigen vector and eigen values
   q = sym('Temirlan', [2 1], 'real');
   syms u;
   [V,E] =  eig(A);
   L = pinv(V)*A*V; %first output
   B_new = pinv(V)*B;
   C_new = C*V;
   q_dot = L*q + B_new * u %second output
end