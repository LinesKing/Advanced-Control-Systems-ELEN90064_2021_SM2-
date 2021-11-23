clc
clear all

%% Q2
% 3.
syms R L C s

% ss2tf
A = [-2*R/L 1/L; -1/C 0];
B = [R/L; 1/C];
C = [-R 1];
D = R;

Phi=inv(s*eye(2)-A);
H=C*Phi*B+D;
pretty(simplify(H))

%% Q3
% 3.
% pole assignment
A = [0.65104 0.05; 0 0];
B = [0.051; 1];
C = [1 0];
D = [0];
K = acker(A,B,[0 0])

%% Q4
% eigenvalue
A = [0 1; 0 -1];
B = [0; 2];
C = [1 0];
D = 0;

Ad = [0 10; -10 0];
Cd = [1 0];

Aaug = [A zeros(2,2); Cd'*C Ad'];
Baug = [B; zeros(2,1)];

K = acker(Aaug,Baug,[-1 -1 -2 -2])

%% Q6
% 2.
% delayed state space model
DelayT(1) = struct('delay',1,'a',0,'b',1,'c',0,'d',0);
sysc = delayss(-1,0,1,0,DelayT) 

% discretize
sysd = c2d(sysc,0.5,'zoh')

% 3.
A = 0.6065;
B = 0.3935;
C = 1;
D = 0;
G = 1;
H = 0;

G_ss = ss(A, [B G], C, [D H]);

W = [0.1 0; 0 0.1];
V = 0.2;

[Kest, L, P] = kalman(G_ss, W, V);
L

Q = diag([1 1]);
R = 1;

A_aug = [A 0;
         -C 0];
B_aug = [B;
         0];

[K_aug,P_aug,L_aug] = lqr(A_aug,B_aug,Q,R);

KX = K_aug(1)
KI = K_aug(2)
