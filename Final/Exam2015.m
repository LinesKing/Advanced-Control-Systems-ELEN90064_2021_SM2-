clc
clear all

%% Q1
% eigenvalue, controllability and observability
A = [0 1; -1 2];
B = [1; 0];
C = [1 0];

e = eig(A) % eigenvalue
Gamma_c = [B A*B] % controllability
Gamma_o = [C; C*A] % observability

A = [-1 2; 0 -2];
B = [1; 0];
C = [1 0];

e = eig(A) % eigenvalue
Gamma_c = [B A*B] % controllability
Gamma_o = [C; C*A] % observability

%% Q2
% 1.
% tf2ss
den = [1 -1];
num = [1 -2.5 1.5];

[A,B,C,D] = tf2ss(den,num)

% 2.
% inverse Z
syms z
F = (z-1)/((z-1.5)*(z-1)) * z/(z-1);
iztrans(F)

% 3.
% eigenvalue, controllability and observability
A = [0 1; -1.5 2.5];
B = [1; 1.5];
C = [1 0];

e = eig(A) % eigenvalue
Gamma_c = [B A*B] % controllability
Gamma_o = [C; C*A] % observability


%% Q4
% (c)
% root locus
sys = tf([1],[1 0 0 0 0]);
rlocus(sys)

% pole assignment
A = [0 -1; 0 0];
B = [0; -1];
C = [1 0];
D = [0];
K = acker(A,B,[-2.3+2.3i -2.3-2.3i])

% (d)
% discretize state space model
A = [0 -1; 0 0];
B = [0; -1];
C = [1 0; 0 1];
D = [0; 0];
sysc = ss(A,B,C,D);

sysd = c2d(sysc,0.1,'zoh')

% pole assignment
A = [1 -0.1; 0 1];
B = [0.005; -0.1];
C = [1 0; 0 1];
D = [0; 0];
K = acker(A,B,[0 0])

Gcl = ss(A-B*K,B,C,D)
Gcltf = tf(Gcl)

% (e)
% inverse Z
syms z
F1 = 0.005*(z+1)/z/(z-1);
iztrans(F1)
F2 = -0.1/z;
iztrans(F2)

% (f)
% full state observer
A = [1 -0.1; 0 1];
C = [1 0];
L = acker(A',C',[0 0])'



