clear; close all; clc;

x_start = 2; 
y_start = 3;
L = 5; 

x = 4;
y = 5;

result = pointInsideSquare(x, y, x_start, y_start, L);
disp(result);


%% Function is written is separate file "pointsInsideSquare"

% function result = pointInsideSquare(x, y, x_start, y_start, L)
%     x_end = x_start + L;
%     y_end = y_start + L;
% 
%     if x >= x_start && x <= x_end && y >= y_start && y <= y_end
%         result = 'YES'; 
%     else
%         result = 'NO'; 
%     end
% end