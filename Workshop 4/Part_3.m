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

%% 3.1
% observable only pitch velocity and yaw
Cprime = [0 1 0 0;
          0 0 1 0];
Obprime = obsv(A,Cprime);
unobprime = length(A)-rank(Obprime);

%% 3.2
% Full order
G = eye(4);
H = zeros(2,4);

G_ss = ss(A, [B G], Cprime, [D H]);

W = 5e-7*[0.01 0 0 0; 0 1 0 0; 0 0 0.01 0;0 0 0 1];
V = [2e-5 0; 0 1e-8];

[Kest, L, P] = kalman(G_ss, W, V);

A_aug = [A zeros(4,2); C zeros(2,2)];
B_aug = [B; zeros(2,2)];

K_aug = place(A_aug,B_aug,[-4 -4 -2 -2 -3 -3]);

KX = K_aug(1:2,1:4);
KI = K_aug(1:2,5:6);

% Reduced order
T = [0 1 0 0; 0 0 1 0; 1 0 0 0; 0 0 0 1];
Aprime = T*A*T';
Bprime = T*B;
Cprime = Cprime*T';
Dprime = D;

A11 = Aprime(1:2,1:2);
A12 = Aprime(1:2,3:4);
A21 = Aprime(3:4,1:2);
A22 = Aprime(3:4,3:4);
B1 = Bprime(1:2,1:2);
B2 = Bprime(3:4,1:2);

G = eye(2);
H = zeros(2,2);

G_ss = ss(A22, [B2 G], A21, [Dprime H]);

W = 1e-11*[1 0; 0 0.01];
V = [2e-5 0; 0 1e-8];

[Kestr, Jr, Pr] = kalman(G_ss, W, V);
















