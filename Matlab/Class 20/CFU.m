A = 1/400;
Gp = 1/2000;
Tset = 70;
T = 0:150;
t = zeros(150,1);
t(1:2) = 80;

for i=2:(length(T)-1)
	disp(i);
	t(i+1) = (2-A)*(t(i)) + (A-1)*(t(i-1)) + Gp*(Tset - t(i));
end

figure;
plot(T,t);
xlabel('time (min)');
ylabel('T (degrees F)');