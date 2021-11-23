clc
clear all

%% Convert state-space representation to transfer function

A = [0 1; -1 -2];
B = [0; 3];
C = [1 1];
D = 0;
[num,den] = ss2tf(A,B,C,D)

syms s
G = poly2sym(num,s)/poly2sym(den,s)
Y = G/s^2
y = ilaplace(Y)
syms t

subs(y,t,1)

%% Full state feedback

A = [1 0 0; 0 -1 0; -1 0 1];
B = [0; 0; 1];
C = [1 0 0];
D = 0;

% K = sym('K', [1 3])
K = [8.5 15 18];
A_hat = A - B*K
[num,den] = ss2tf(A_hat,B,C,D)

syms s
G = poly2sym(num,s)/poly2sym(den,s)

%%
A = [-1 0 2; 0 -1 3; 0 0 3];
B = [0; 1; 1];
C = [1 2 1];
e = eig(A)
Gamma_c = [B A*B]
Gamma_o = [C; C*A]

%%
eA = [0.5 1; 0 0.5]
eA^(-3)
eA^2

%%
A = [1 -3; -5 2];
B = [1; 1];
C = [1 0];
D = 0;
sys = ss(A,B,C,D);
T = [-0.25 -0.875; 0.25 -0.375];
sysT = ss2ss(sys,T)

%%
x1 = 0;
x2 = 0;

for i = 1:14
   x1_new = x1+x2;
   x2_new = -x1-x2+3;
   x1 = x1_new
   x2 = x2_new
end









