n =[-200:200]; x = 2*sin(0.01*pi*n).*cos(0.5*pi*n);

Hf = figure;
Hs = stem(n,x,"filled");
axis(min(n)-1,max(n)+1,min(x)-1,max(x)+1);
xlabel('n'); ylabel('x(n)');
title('hong');