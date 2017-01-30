hold on;
grid on;
x = [0:0.5:10];
y = x.^0.3 + sin(x);
z = 2./(exp(-x + 5) + 1);

plot(x,y,'go-');
plot(x,z,'c*:');
legend('y','z');
title('Matlab 6 preactivity');
xlabel('x');
ylabel('y and z');