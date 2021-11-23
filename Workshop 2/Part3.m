clc
clear all

delta = 0.05;
G = tf([1.3178],[1 0.28 1.7]);

Gd_c2d = c2d(G,delta,'zoh')
num = Gd_c2d.num{1};
den = Gd_c2d.den{1};

Cd = tf(den,[1 -1 0],delta);
Lambda = Gd_c2d*Cd;
rlocus(Lambda)

K = 10;
