clear all; close all; clc
%% Code 

[z,p] = tf2zp(1, [1 12.5 1 5 0.23])
pzmap(p,z)