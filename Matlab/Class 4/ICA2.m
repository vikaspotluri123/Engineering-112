hold on;
grid on;
load('steel.txt');
strain = steel(:,2);
stress = steel(:,4);
time = steel(:,3);
position = steel(:,1);

subplot(2,2,1);
plot(strain*100,stress,'b');
xlabel('Strain (%)');
ylabel('Stress (mPa)');
axis([0,30,0,800]);
grid on;

subplot(2,2,2);
plot(time,position,'r');
xlabel('time (sec)');
ylabel('displacement distance (mm)');
grid on;

subplot(2,2,3);
plot(position,strain*100,'g');
xlabel('displacement distance (mm)');
ylabel('Strain (%)');
grid on;

subplot(2,2,4);
plot(time,stress,'m');
xlabel('time (sec)');
ylabel('Stress (mPa)');
grid on;
