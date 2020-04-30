% change_freq.m

clear all, close all
[x,fe] = wavread('PAROLE.wav',[121800 147500]);
n = 2;
x1 = x(1:n:end); % x1 = [x(1) x(n+1) x(2*n+1)...]
x2 = zeros(n*length(x),1);
x2(1:n:end) = x;  % x2 = [x(1) 0 x(2) 0 x(3) 0...]
