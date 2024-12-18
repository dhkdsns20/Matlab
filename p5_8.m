%% 1. DFS Xtilde1(k)
n1 = [0:100]; xtilde1 = sinc((n1-50)/2).^2 ; N1 = length(n1);
Xtilde1 = dft(xtilde1,N1); k1 = n1;
mag_Xtilde1 = abs(Xtilde1); pha_Xtilde1 = angle(Xtilde1)*180/pi;
zei = find(mag_Xtilde1 < 10^(-8));
pha_Xtilde1(zei) = zeros(1,length(zei));
H1 = figure;
title('One period of the periodic sequence xtilde1(n)','fontsize',10); ylabel('Amplitude');
subplot(2,1,1); h2 = stem(k1,mag_Xtilde1,'filled'); set(h2,'markersize',3);
axis('auto');
title('Magnitude of Xtilde1(k)','fontsize',10); ylabel('Magnitude'); hold on;
subplot(2,1,2); h3 = stem(k1,pha_Xtilde1,'filled'); set(h3,'markersize',3);
axis('auto');
title('Phase of Xtilde1(k)','fontsize',10); xlabel('k'); ylabel('Degrees'); hold on;


[X,w] = freqz(xtilde1,1,1000,'whole');
a = 2*pi/N1; magX = abs(X); phaX = angle(X)*180/pi;
subplot(2,1,1); plot(w/a,magX);
hold off;
subplot(2,1,2); plot(w/a,phaX);
hold off;


