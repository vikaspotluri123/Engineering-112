load('CFUdata.mat');

F = force;
A = (0.505/2)^2*pi;
initial = 2.0000;


stress = F/A;
strain = (length - initial) /  initial;

hold on;
grid on;

plot(strain,stress,'ko-');
disp(strain);
disp(stress);
title('stress vs. strain for material X');
plot(0.0047,37445,'r*')
xlabel('strain');
ylabel('stress');