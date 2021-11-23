clc
clear all

%% Q1
% (e)
syms xd Ks B R

A = [0 1; Ks*(1-xd^2/4) -B];
B = [0; Ks/R*xd*(1+xd^2/4)];
K = acker(A,B,[-1-1i -1+1i])

%% Q4
% discretize state space model
A = [0 -1000; 20 0];
B = [0; 0];
C = [0 1];
D = [0];
sysc = ss(A,B,C,D);

sysd = c2d(sysc,1,'zoh')
A = sysd.A;
B = sysd.B;

T = [0 1; 1 0];
Aprime = T*A*T';
Bprime = T*B;

A11 = Aprime(1,1);
A12 = Aprime(1,2);
A21 = Aprime(2,1);
A22 = Aprime(2,2);
B1 = Bprime(1);
B2 = Bprime(2);

L = acker(A22',A12',[0])'


%% Q6
% observability
A = [-1 1; 0 1];
C1 = [1 0];
C2 = [0 1];
C3 = [1 1];

Gamma_o1 = [C1; C1*A] % observability
Gamma_o2 = [C2; C2*A]
Gamma_o3 = [C3; C3*A]

%% Q9
K = inv([1 1; 1 5])*[2 3; 1 0]*[0.5 -0.3; -0.3 1.1]