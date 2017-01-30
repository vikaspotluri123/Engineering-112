x = xlsread('data.xlsx','x data');
y = xlsread('data.xlsx','y data');
z = xlsread('data.xlsx','z data');
mesh(x,y,z);
xlabel('x');
ylabel('y');
zlabel('z');