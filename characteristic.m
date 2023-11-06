clear all;
close all;
clc;

%% L = 2 and M = 2
syms Q(s) s

Q(s) = s^3 + 15.6 * s^2 + (56+100*8)*s + 1000;

roots = solve(Q(s) == 0, s);

precision = 2;

for i = 1:length(roots)
    root_value = vpa(roots(i), precision);
    fprintf('Root %d: %f\n', i, root_value);
end