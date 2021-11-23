clc
clear all

%% Q2
% (a)
A = [0 0; 1 -1];
e = eig(A)

% (c)
A = [0 0; 1 -1];
B = [1; 0];
K = acker(A,B,[-1-1i -1+1i])

% (e)
syms qw qv p11 p12 p21 p22
A = [0 0; 1 -1];
B = [1; 0];
C = [0 1];
D = 0;
G = eye(2); % state
H = zeros(1,2); % input state

G_ss = ss(A, [B G], C, [D H]);

W = [qw 0; 0 0];
V = qv;

P = [p11 p12; p21 p22];

CARE = A*P+P*A'-P*C'*inv(V)*C*P+W

%% Q3
% (a)
A = [0 0; 1 -1];
B = [1; 0];
C = [0 1];
D = [0];
sysc = ss(A,B,C,D);

sysd = c2d(sysc,0.1,'zoh')

% (b)
k = acker(A,B,[0 0])


% (c)
Adelta = [0 0; 0.9516 -0.952];
Bdelta = [1; 0.04837];

[den,num] = ss2tf(Adelta,Bdelta,C,D)





