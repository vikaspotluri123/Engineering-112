hold on;
load('fitdata.mat');
scatter(x,y,'black');
plot(x,yfit,'LineWidth',2,'Color','black');
plot(x,yfit + 0.3,'LineWidth',2,'Color','red');
plot(x,yfit - 0.3,'LineWidth',2,'Color','red');
xlabel('x data');
ylabel('y data and fit');
legend('Data','Fit','Lower/Upper Bounds','Location','Northwest');