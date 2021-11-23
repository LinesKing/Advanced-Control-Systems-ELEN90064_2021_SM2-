clc
clear all

%% Tune
G = tf([1.3178],[1 0.28 1.7]);

% Critical gain and period
K_cr = 1;
T_cr = 3.636;

% Compute PID gains
K_D = 80*0.6*K_cr*0.125*T_cr;
K_P = 100*0.6*K_cr;
K_I = 50*0.6*K_cr/(0.5*T_cr);

tau_p = 1e-3;

C = tf([K_D K_P K_I],[tau_p 1 0])