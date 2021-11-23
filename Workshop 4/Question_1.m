A = [0 1; 0 0];
B = [0; 1];
C = [1 0];
D = 0;

G = eye(2);
H = zeros(1,2);

G_ss = ss(A, [B G], C, [D H]);

W = [1 0; 0 1];
V = 4;

[Kest, L, P] = kalman(G_ss, W, V)
