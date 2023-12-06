clear all
%Example 2

% Stability analysis of the discrete-time fractional-order systems.

%------------------------------------------------------------------------
% example 2.a (system stable)
%------------------------------------------------------------------------
% system matrices [a,b,c,d];
a=[-1.2 -0.2 -1;1 0 0;0 1 0];
b=[1;0;0];
c=[0 0 1];
d=0;
% sampling period h=0.4;
h=0.4;
% fractional order 
alpha=[pi-1.81;1.1;0.71];

sys=ss(a,b,c,d,h); % create the state-space system
set(sys,'Notes','alpha'); % create the additional parameter alpha (fractional-orders)
set(sys,'UserData',alpha); % set the additional parameter alpha
U_imp=[1/h;zeros(10000,1)]; % create input signal as the Kronecker delta
[y]=simNonFrac(sys,U_imp); % time simulation of the system

% the plot of the impulse response 
figure
plot(y(1:500))
xlabel('k [steps]')
title('Impulse response for a_{1,1}=1.2')
grid

% create the Mikhailov plot for the considered system
[p_w,Delta_p_w]=mikhailovCurve([1 1.2 0.2 1],[sum(alpha) sum(alpha(2:3)) alpha(3) 0],h);% create the Mikhailov plot 

% the plot of the Mikhailov plot
figure
plot(real(p_w),imag(p_w))
xlabel('Re')
ylabel('Im')
title('Mikhailov plot for a_{1,1}=1.2')
grid

% show of the approximation of \Delta p_w |_0^\pi 
'The approximation of the argument change of Mikhailov curve for a_{1,1}=1.2:'
Delta_p_w


%------------------------------------------------------------------------
% example 2.b {system unstable}
%------------------------------------------------------------------------

% system matrices [a,b,c,d];
a=[-1 -0.2 -1;1 0 0;0 1 0];
a=[-0.35 -0.05 -0.15;1 0 0;0 1 0];
b=[1;0;0];
c=[0 0 1];
d=0;
% sampling period h=0.4;
h=0.4;
% fractional order 
alpha=[pi-1.81;1.1;0.71];

sys=ss(a,b,c,d,h); % create the state space system
set(sys,'Notes','alpha'); % create the additional parameter alpha (fractional-orders)
set(sys,'UserData',alpha); % set the additional parameter alpha 
U_imp=[1/h;zeros(10000,1)]; % create imput signal as the Kronecker delta
[y]=simNonFrac(sys,U_imp); % time simulation of the system

% the plot of the impulse response 
figure
plot(y(1:500))
xlabel('k [steps]')
title('Impulse response for a_{1,1}=1.0')
grid


% create the Mikhailov plot for the considered system
[p_w,Delta_p_w]=mikhailovCurve([1 1 0.2 1],[sum(alpha) sum(alpha(2:3)) alpha(3) 0],h);% create the Mikhailov plot 

% the plot of the Mikhailov plot
figure
plot(real(p_w),imag(p_w))
xlabel('Re')
ylabel('Im')
title('Mikhailov plot for a_{1,1}=1.0')
grid

% show of the approximation of \Delta p_w |_0^\pi 
'The approximation of the argument change of Mikhailov curve for a_{1,1}=1.0:'
Delta_p_w
