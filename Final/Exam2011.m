clc
clear all

%% Q2
% a)
% ss2tf
A = [0 1; -3 -5];
B = [0; 1];
C = [1 0];
D = 0;

[den,num] = ss2tf(A,B,C,D)

% c)
Co = ctrb(A,B)
Ob = obsv(A,C)



