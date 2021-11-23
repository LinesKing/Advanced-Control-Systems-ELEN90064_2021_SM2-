clc
clear all
clc
clear all

%% Workshop 1
G = tf([1.3178],[1 0.28 1.7]);

% Critical gain and period
K_cr = 1;
T_cr = 3.636;

% Compute PID gains
K_D = 80*0.6*K_cr*0.125*T_cr;
K_P = 100*0.6*K_cr;
K_I = 50*0.6*K_cr/(0.5*T_cr);

tau_p = 0.2;

C = tf([K_D K_P K_I],[tau_p 1 0]);

%% Workshop 2 
%%Problem 1
% (a) Simple emulation approach
delta_a_range = 0.045:0.0025:0.055;

for i = 1:length(delta_a_range)
    delta_a = delta_a_range(i);
    numa(i, :) = [ 21.816  60*delta_a-43.632 21.816-60*delta_a+16.44*delta_a^2 ]/tau_p;
    dena(i, :)  = [ tau_p delta_a-2*tau_p tau_p-delta_a ]/tau_p;
    Cda_manual = tf(numa(i, :) ,dena(i, :) ,delta_a)
end

% (b) Equivalent zero-order hold approach
delta_b_range = 0.0375:0.0025:0.0475;

for i = 1:length(delta_b_range)
    delta_b = delta_b_range(i);
    Cdb_c2d = c2d(C,delta_b,'zoh')
    numb(i, :) = Cdb_c2d.num{1};
    denb(i, :) = Cdb_c2d.den{1};
end

% e = exp(1);
% numb = [ 436.32  16.44*delta_b-59.178*e^(-20*delta_b)-813.462 377.142+59.178*e^(-20*delta_b)-16.44*delta_b*e^(-20*delta_b) ];
% denb = [ 1 -1-e^(-20*delta_b) e^(-20*delta_b) ];
% Cdb_manual = tf(numb,denb,delta_b)

% (c) Bilinear transformation with pre-warping
delta_c_range = 0.03:0.0025:0.04;
% omega = 17.4;
[~,omega] = getPeakGain(1/(1+C*G)) %%Get the frequency of peak gain



for i = 1:length(delta_c_range)
    delta_c = delta_c_range(i);
    alpha = omega*delta_c/2*cot(omega*delta_c/2);
    [numd(i, :) ,dend(i, :) ] = bilinear([K_D K_P K_I],[tau_p 1 0],2*alpha/delta_c);
    Cdc_c2d = tf(numd(i, :) ,dend(i, :) ,delta_c)
end

% opt =  c2dOptions('Method','tustin','PrewarpFrequency',omega);
% Cdc_c2d_ = c2d(C,delta_c,opt)

% bode(1/(1+G*C));
% beta = 2*alpha/delta_c;
% numc = [ 16.44+60*beta+21.816*beta^2  32.88-43.632*beta^2 16.44-60*beta+21.816*beta^2 ]/(0.05*beta^2+beta);
% denc = [ 0.05*beta^2+beta -0.1*beta^2 0.05*beta^2-beta ]/(0.05*beta^2+beta);



% Cdc_manual = tf(numc,denc,delta_c)






