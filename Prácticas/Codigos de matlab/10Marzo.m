M = 1;
m = 0.25;
b = 0.08;
g = 10;
L = 0.25;
I = 1/3 * m * L^2;
beta = (M + m)*(I + m*L^2) - (m*L)^2;

NUM = [m*L/beta, 0];
DEN = [1, (I + m*L^2)*b/beta, -(M + m)*m*L*g/beta, -m*L*g*b/beta];

P = tf(NUM, DEN);

impulse(P);

