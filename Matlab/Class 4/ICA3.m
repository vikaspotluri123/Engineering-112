k = logspace(1,4,50);
TKE = 1000*k.^(-5/3);

subplot(2,2,1);
plot(k,TKE,'r');
xlabel('k');
ylabel('TKE');
title('normal plot');
grid on;

subplot(2,2,2);
semilogx(k,TKE,'r');
xlabel('k');
ylabel('TKE');
title('semilogx plot');
grid on;

subplot(2,2,3);
semilogy(k,TKE,'r');
xlabel('k');
ylabel('TKE');
title('semilogy plot');
grid on;

subplot(2,2,4);
loglog(k,TKE,'r');
xlabel('k');
ylabel('TKE');
title('log-log plot');
grid on;
