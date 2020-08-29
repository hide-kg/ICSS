rng(10)
data = normrnd(0,1,[390, 1]);
data(391:517,1) = normrnd(0,0.365,[127,1]);
data(518:700,1) = normrnd(0,1.033,[183,1]);

D_star = 1.358;

cp = ICSS(data, D_star);

[sdp, sdn] = sd_bands(data, cp);

figure
plot(data)
hold on
plot(sdp)
hold on
plot(sdn)
