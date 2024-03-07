clc; format compact; clear; close all; 
%stable focus
    
    [x1, x2] = meshgrid(-1 : 0.1 : 1, -1 : 0.1 : 1);
    
    x1dot = 4 * x2;
    x2dot = -2*x2 - x1;
    
    quiver(x1, x2, x1dot, x2dot);