clear all;close all;clc

syms s sys(s) G(s) w R(w) I(w)

sys = 5/(0.6*s + 1);

sys = subs(sys,s,1j*w);

R(w) = real(sys);
I(w) = imag(sys);


ww = linspace(-1000,1000,10000);

R = eval(subs(R(w),w,ww));
I = eval(subs(I(w),w,ww));

plot(R,I,"K-","LineWidth",2)

%% Use Nyquist command

sys = tf(5,[0.6 1]);

nyquist(sys)
