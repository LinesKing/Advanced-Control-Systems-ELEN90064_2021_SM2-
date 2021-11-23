A_rho = [0 1; 0 0];
B_rho = [0; 1];
C_rho = eye(2);
D_rho = zeros(2,1);

A_aug = [A zeros(2); B_rho*C A_rho];
B_aug = [B; zeros(2,1)];

Q = eye(4);
R = 1;

[K_aug,~,~] = lqr(A_aug,B_aug,Q,R);
K_x = K_aug(1:2);
K_rho = K_aug(3:4);