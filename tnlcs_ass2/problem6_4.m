clc; format compact; clear; close all;
    
    [x1, x2] = meshgrid(-1 : 0.1 : 1, -1 : 0.1 : 1);
    
    x1dot = x2;
    x2dot = 4*x2 - 13*x1;
    
    quiver(x1, x2, x1dot, x2dot);