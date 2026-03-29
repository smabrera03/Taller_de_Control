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


%% Ancho de banda
close all;
s = tf('s');
zeta = 1;
wn = 10;
k = 1;

L = k * wn^2/(s^2 + 2*zeta*wn*s + wn^2);

opt = bodeoptions();
opt.grid = 'On';
opt.PhaseMatching = 'On';
opt.PhaseMatchingValue = -180;
opt.PhaseMatchingFreq = 1;

figure();
bode(L, opt, {0.1, 10000});
title('Bode L');

T = L/(1 + L);
figure();
bode(T, opt, {0.1, 10000});
title('Bode T');

