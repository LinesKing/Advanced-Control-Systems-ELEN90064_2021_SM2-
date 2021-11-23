clc
clear all

% Quanser AERO System Model Parameters
Mb = 1.15;
Jyy = 0.02;
Jzz = 0.01;
Bp = 0.005;
By = 0.005;
g = 9.81;
yg = 0;
zg = 0.0071;
Kpp = 0.0005466;
Kyy = 0.0005466;
kpy = 0.05;

% Linearised state space model
A = [0 1 0 0;
    -Mb*g*zg/(Mb*zg^2+Jyy) -Bp/(Mb*zg^2+Jyy) 0 0;
    0 0 0 1;
    0 0 0 -By/Jzz];
B = [0 0;
    Kpp/(Mb*zg^2+Jyy) kpy*Kyy/(Mb*zg^2+Jyy);
    0 0;
    kpy*Kpp/Jzz Kyy/Jzz];
C = [1 0 0 0;
    0 0 1 0];
D = [0 0; 
    0 0];

A1 = A(1:2,1:2);
A2 = A(3:4,3:4);
B1 = B(1:2,1);
B2 = B(3:4,2);
C1 = C(1,1:2);
C2 = C(2,3:4);
D1 = D(1);
D2 = D(2);

[num1, den1]=ss2tf(A1,B1,C1,D1);
[num2, den2]=ss2tf(A2,B2,C2,D2);

G1 = tf(num1,den1);
G2 = tf(num2,den2);

%% 4.1
Cprime = [0 1 0 0;
          0 0 1 0];

% Full order
G = eye(4);
H = zeros(2,4);

G_ss = ss(A, [B G], Cprime, [D H]);

W = 5e-7*[0.01 0 0 0; 0 1 0 0; 0 0 0.01 0;0 0 0 1];
V = [2e-5 0; 0 1e-8];

[Kest, L, P] = kalman(G_ss, W, V);

Q = diag([1 1 1 1 25e1 1e1]);
R = diag([1e-4 1e-4]);

A_aug = [A zeros(4,2);
         -C zeros(2,2)];
B_aug = [B;
         zeros(2,2)];

[K_aug,P_aug,L_aug] = lqr(A_aug,B_aug,Q,R);

KX = K_aug(1:2,1:4);
KI = K_aug(1:2,5:6);

%% 4.2
Cprime = [0 1 0 0;
          0 0 1 0];

% Full order
% G = eye(4);
% H = zeros(2,4);
% 
% G_ss = ss(A, [B G], Cprime, [D H]);
% 
% W = 5e-7*[0.01 0 0 0; 0 1 0 0; 0 0 0.01 0;0 0 0 1];
% V = [1e-5 0; 0 2e-8];
% 
% [Kest, L, P] = kalman(G_ss, W, V);

Q = diag([1 1 1 1 9e1 9e1 1e1 1e1]);
R = diag([1e-4 1e-4]);

Z = [0 0;1 0; 0 0; 0 1];
A_rho = [0 2*pi/5; -2*pi/5 0];
A_aug = [A zeros(4,4);
         -Z*C [A_rho zeros(2); zeros(2) A_rho]];
B_aug = [B;
         zeros(4,2)];

[K_aug,~,~] = lqr(A_aug,B_aug,Q,R);

KXX = K_aug(1:2,1:4);
KII = K_aug(1:2,5:8);


A_tild = [A_rho zeros(2); zeros(2) A_rho];
B_tild = Z;
C_tild = eye(4);
D_tild = zeros(4,2);





