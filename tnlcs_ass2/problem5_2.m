    clc; close all; clear; format compact; 
    
    [x1,x2] = meshgrid(-1 : 0.1 : 1, -1 : 0.1 : 1);
    
    x1dot = -x2;
    x2dot = x1 + x2 - 3.*atan(x1 + x2);
    

    norm = sqrt(x1dot.^2 + x2dot.^2);
    x1dot = x1dot./norm;
    x2dot = x2dot./norm;
    
    quiver(x1, x2, x1dot, x2dot);
    
    title('Phase Portrait of the System');