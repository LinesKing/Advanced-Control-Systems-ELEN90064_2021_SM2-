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
kpy = 0;

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
D = [0; 0];

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

G1 = tf(num1,den1)
G2 = tf(num2,den2)

%% PID
tau_p = 1e-2;

% Pitch
% Critical gain and period
K_cr1 = 50;
T_cr1 = 2.5;

% Compute PID gains
K_D1 = 30*0.6*K_cr1*0.125*T_cr1;
K_P1 = 20*0.6*K_cr1;
K_I1 = 50*0.6*K_cr1/(0.5*T_cr1);

C1 = tf([K_D1 K_P1 K_I1],[tau_p 1 0])

% Yaw
% Critical gain and period
K_cr2 = 50;
T_cr2 = 3.872;

% Compute PID gains
K_D2 = 30*0.6*K_cr2*0.125*T_cr2;
K_P2 = 30*0.6*K_cr2;
K_I2 = 30*0.6*K_cr2/(0.5*T_cr2);

C2 = tf([K_D2 K_P2 K_I2],[tau_p 1 0])











