A = 10;
R = 10;
dt = 1;
Hmax = 4;
Gp = 0.2;
t = 1:100;
h(1:2) = 0;
for i= 2:(length(t)-1)
	h(i+1) = (1 - (dt/(A*R)))*(h(i)) + ((Gp(dt))/A)*(Hmax-h(i));
end

figure;
plot(t,h);
xlabel('t (minutes)');
ylabel('height (m)');