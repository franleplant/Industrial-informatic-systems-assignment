G1 = tf([1],[.12 1]);
A1 = 12;
G2 = tf([.15 1], [.15 0]);
G3 = tf([1], [.02 1]);
A2 = 12;
G4 = tf([.015 1], [.015 0]);
G5 = tf([1.28], [.0033 1]);
G6 = tf([20], [.03 1]);
G7 = tf([1], [.44 0]);
H1 = tf([1], [.005 1]);


M1 = G1*A1*G2*G3*A2*G4*G5*G6*G7;
L1 = (A1*G2*G3*A2*G4*G5*G6*G7*(-1)*H1) + (A2*G4*G5*G6*(-1)) + (G6*G7*(-1));

M = M1/L1


bode(M);


% To get the array representation of M
% [num, den] = tfdata(M, 'v')
