clc
clear all

%% Q1
% (c)
% discretize state space model
A = [-20];
B = [0.2919];
C = [0.1];
D = [0];
sysc = ss(A,B,C,D);

sysd = c2d(sysc,0.1,'zoh')

% (e)
A = [0 1 0; 0 0 1; 0 0 0.1353];
B = [0; 0; 0.01262];
C = [0.1 0 0];
L = acker(A',C',[0 0 0])'
K = acker(A,B,[0 0 0])

%% Q2
% .
syms a b
A = [1 -1 2 10; 1 -1 4 7; 0 0 -2 2; 0 0 0 -3];
B = [1; 1; 0; 0];
C = [1 -1 0 0];
D = 0;

% Co = ctrb(A,B)
% Ob = obsv(A,C);

Gamma_c = [B A*B A^2*B A^3*B] % controllability
Gamma_o = [C; C*A; C*A^2; C*A^3] % observability

% .
e = eig(A)
sys = ss(A,B,C,D);
[sys_min,U] = minreal(sys);

A_Kalman = U*A*U';
B_Kalman = U*B;
C_Kalman = C*U';
D_Kalman = D;

%% Q3
% (a)
sys = tf([1],conv([1 10],[1 3.2 16]));
rlocus(sys)

% (b)
syms k
Ac = [0 1 0; -16 -3.2 0; 1 0 -10];
Cc1 = [1 0 0];
Cc2 = [0 0 1];

% Gamma_o1 = [Cc1; Cc1*Ac; Cc1*Ac^2] % observability
% Gamma_o2 = [Cc2; Cc2*Ac; Cc2*Ac^2]
% 
% det(Gamma_o1)
% det(Gamma_o2)

Ob1 = obsv(Ac,Cc1)
Ob2 = obsv(Ac,Cc2)

cond(Ob1)
cond(Ob2)

% (d)
A_aug = [0 1 0; -16 -3.2 0; 0.1 0 0];
B_aug = [0; 1; 0];

K_aug = acker(A_aug,B_aug,[-1 -1 -2]);

KX = K_aug(1,1:2)
KI = K_aug(1,3)

% (e)
Ac = [0 1; -16 -3.2];
Cc = [0.1 0];

L = acker(Ac',Cc',[-10 -10])'

% (f)
A = [0 1; -16 -3.2];
B = [0; 1];
C = [0.1 0];
D = 0;

G = eye(2);
H = zeros(1,2);

G_ss = ss(A, [B G], C, [D H]);

W = [0.01 0; 0 0.1];
V = 0.01;

[Kest, L, P] = kalman(G_ss, W, V);
L

Q = diag([1 1]);
R = 1;

[K,P,L] = lqr(A,B,Q,R);
K




