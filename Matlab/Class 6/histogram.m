data = load('data.txt');
temp = data(:,1);
sex = data(:,2);
age = data(:,3);

hist(temp,12);
xlabel('Temperature');
ylabel('Frequency');
title('Temperature for adult Males and Females');
mystat(temp);