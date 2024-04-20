num = [1 0];
den = [1 -1 1];    
G = tf(num, den);    

nyquist(G);