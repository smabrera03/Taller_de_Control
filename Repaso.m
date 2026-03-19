%% Margen de fase

s = tf('s');

w = 1000;
zeta = 0.1;
k = db2mag(270);
L = k/( s * (s^2 + 2*zeta*w*s + w^2)) * (s + 1000) * (s + 10000)/(s + 50000)^2;

opt = bodeoptions();
opt.grid = 'On';
opt.PhaseMatching = 'On';
opt.PhaseMatchingValue = -180;
opt.PhaseMatchingFreq = 1;

bode(L, opt, {100, 100000});
title('Bode L');


%%