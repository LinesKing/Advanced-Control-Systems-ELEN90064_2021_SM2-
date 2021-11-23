clc
clear all

%% Eigenvalue, Controllability and Observability
A = [1 -0.1; 0 1];
B = [0.005; -0.1];
C = [1 0];

e = eig(A) % eigenvalue
Gamma_c = [B A*B] % controllability
Gamma_o = [C; C*A] % observability

%% Transfer function to State space or versus
% tf2ss
den = [-1];
num = [1 -1];

[A,B,C,D] = tf2ss(den,num)

% ss2tf
A = [1 -0.1; 0 1];
B = [0.005; -0.1];
C = [1 0];
D = 0;

[den,num] = ss2tf(A,B,C,D)

%% Z/Laplace transform
% Z
syms n
f = sin(n);
ztrans(f)

% inverse Z
syms z
F = (z-1)/((z-1.5)*(z-1)) * z/(z-1);
iztrans(F)

% Laplace
syms a t
f = exp(-a*t);
laplace(f)

% inverse Laplace
syms s
F = 1/s;
ilaplace(F)

%% Transfer ss to companion
A = [0 1; -1.5 2.5];
B = [1; 1.5];
C = [1 0];
D = 0;
sys = ss(A,B,C,D);

csys = canon(sys,'companion')
% Controllable
ACon = csys.A'
BCon = csys.C'
CCon = csys.B'
DCon = csys.D

% Observable
AObs = csys.A
BObs = csys.B
CObs = csys.C
DObs = csys.D

%% Root locus
sys = tf([1],[1 0 0 0 0]);
rlocus(sys)

%% Pole assignment
A = [1 -0.1; 0 1];
B = [0.005; -0.1];
C = [1 0; 0 1];
D = [0; 0];
K = acker(A,B,[0 0])

Gcl = ss(A-B*K,B,C,D)
Gcltf = tf(Gcl)

%% Full state observer
A = [2 1 0; 0 0 3; 0 -3 0];
B = [1; 0; 0];
C = [1 0 0];
L = acker(A',C',[-1 -1 -1])'

%% Discretize state space model
A = [0 -1; 0 0];
B = [0; -1];
C = [1 0; 0 1];
D = [0; 0];
sysc = ss(A,B,C,D);

sysd = c2d(sysc,0.1,'zoh')


