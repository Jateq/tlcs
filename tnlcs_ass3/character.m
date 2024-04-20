clear;
close all;
clc;

s = tf('s');

numerator = 1;
denominator = (s + 1)^2 * (s + 2)^2;
G = numerator / denominator
nyquist(G)