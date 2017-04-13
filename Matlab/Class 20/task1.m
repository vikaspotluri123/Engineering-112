temp = 700;
gp = logspace(0,2);
y = (gp*temp)./(1+gp);
figure;
plot(gp,y);
xlabel('Gp');
ylabel('T_{actual}(degrees C)');