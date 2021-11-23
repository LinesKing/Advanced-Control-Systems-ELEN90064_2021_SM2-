clc
clear all


%% Q2
% b)
syms a
eig([a 1; a 0])

% d)
% ss2tf
A = [-1 1; -1 0];
B = [1; 1];
C = [1 0];
D = 0;

sysc = ss(A,B,C,D);

sysd = c2d(sysc,0.1,'zoh')

eig([0.9002   0.095; -0.095  0.9952])

%% Q3
% b)
syms a b c
A = [a 0 4 0; 3 -5 7 1; 0 0 -10 0; 0 0 1 -20];
B = [b; -1; 0; 0];
C = [3 0 c 0];

Gamma_c = [B A*B A^2*B A^3*B] % controllability
Gamma_o = [C; C*A; C*A^2; C*A^3] % observability

% c)
A11 = [a 0; 3 -5];
B1 = [b; -1];

Gamma_c = [B1 A11*B1]

% e)
C1 = [3 0];
D = 0;

[den,num] = ss2tf(A11,B1,C1,D)

%% Q4
% a)
A = [3 2; 0 -0.5];
B = [0; 1];
C = [1 0];
D = 0;
Gamma_c = [B A*B]

K = acker(A,B,[-1 -2])

% b)
Q = [1 1/2; 1/2 1];
R = 1;

[K,P,L] = dlqr(A,B,Q,R)

% c)
W = [0.1 0; 0 0.1];
V = 0.1;

G = eye(2);
H = zeros(1,2);

G_ss = ss(A, [B G], C, [D H]);

[Kest, L, P] = kalman(G_ss, W, V)
L



