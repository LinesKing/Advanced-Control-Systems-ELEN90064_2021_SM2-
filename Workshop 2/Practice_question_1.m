C = tf([1 3],[1 6 0])
Cd = c2d(C,0.5,'zoh')
Cdd = c2d(C,0.5,'foh')

G = tf([1],[1 3])
bode(1/(1+G*C))
