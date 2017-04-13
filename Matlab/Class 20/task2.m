m = 20;
Gp = 20;
c = 0.04;

x0 = 65;

x(1:2) = 0;

dt = 0.1;
t = 0:dt:40;
nt = length(t);

for tt = 2:nt-1
	x(tt+1) = 2*x(tt) - x(tt-1) - ((3*c*dt)/m)*(x(tt)^2)*(x(tt)-x(tt-1)) + ((Gp*(dt^2))/m)*(x0-x(tt));
end

figure;
plot(t,x);
xlabel('t (sec)');
ylabel('speed (mph)');