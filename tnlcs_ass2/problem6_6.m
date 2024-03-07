clc; format compact; close all; clear;
    
    [x1, x2] = meshgrid(-1 : 0.1 : 1, -1 : 0.1 : 1);
    
    x1dot = x2;
    x2dot = -6*x1;
    
    quiver(x1, x2, x1dot, x2dot);