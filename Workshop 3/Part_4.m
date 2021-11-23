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
% yaw controllable
Bprime = [0 0;
    0 kpy*Kyy/(Mb*zg^2+Jyy);
    0 0;
    0 Kyy/Jzz];
Coprime = ctrb(A,Bprime);
uncoprime = length(A) - rank(Coprime);

% controllable
Co = ctrb(A,B);
unco = length(A) - rank(Co)

% observable only pitch
Cprime = [1 0 0 0;
          0 0 0 0];
Obprime = obsv(A,Cprime);
unobprime = length(A)-rank(Obprime)

% detectable only pitch
G=tf(ss(A,B,Cprime,D))

% observable 
Ob = obsv(A,C);
unob = length(A)-rank(Ob)

% Kalman canonical decomposition
sys = ss(A,B,C,D);
[sys_min,U] = minreal(sys);

A_Kalman = U*A*U';
B_Kalman = U*B;
C_Kalman = C*U';
D_Kalman = D;

%% 4.2
K = place(A, B, [-5 -5 -4 -4]);
% K = place(A, B, [-10 -10 -8 -8]);
Gcl = ss(A-B*K,B,C,D)

Gcltf = tf(Gcl);
% input 1 to output 1
num1_1 = cell2mat(Gcltf(1,1).Numerator);
den1_1 = cell2mat(Gcltf(1,1).Denominator);
% input 1 to output 2
num1_2 = cell2mat(Gcltf(2,1).Numerator);
den1_2 = cell2mat(Gcltf(2,1).Denominator);
% input 2 to output 1
num2_1 = cell2mat(Gcltf(1,2).Numerator);
den2_1 = cell2mat(Gcltf(1,2).Denominator);
% input 2 to output 2
num2_2 = cell2mat(Gcltf(2,2).Numerator);
den2_2 = cell2mat(Gcltf(2,2).Denominator);

DCgain = [num1_1(end)/den1_1(end) num2_1(end)/den2_1(end);
          num1_2(end)/den1_2(end) num2_2(end)/den2_2(end)];
Nbar = inv(DCgain);

%% 4.3
A_aug = [A zeros(4,2); C zeros(2,2)];
B_aug = [B; zeros(2,2)];

K_aug = place(A_aug,B_aug,[-4 -4 -2 -2 -3 -3]);

KX = K_aug(1:2,1:4);
KI = K_aug(1:2,5:6);

%% 4.4
L = place(A',C',[-20 -20 -30 -30])';



























