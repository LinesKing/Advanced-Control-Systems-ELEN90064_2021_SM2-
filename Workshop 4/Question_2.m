A22 = 0;
A12 = -10;

B = 1;
G = 1;

D = 0;
H = 0;

G_ss = ss(A22, [B G], A12, [D H]);

W = 1;
V = 1;

[~, L, P] = kalman(G_ss, W, V)
