hold on;
load('fitdata.mat');
scatter(x,y,'ko');
plot(x,yfit,'LineWidth',2,'Color','black');
plot(x,yfit + 0.3,':r','LineWidth',2);
plot(x,yfit - 0.3,':r','LineWidth',2);
xlabel('x data');
ylabel('y data and fit');
legend('Data','Fit','Lower/Upper Bounds','Location','Northwest');