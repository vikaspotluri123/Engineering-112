load('SomeUtility.mat');

disp(fieldnames(failures));

hold on;
for i=1:numel(failures)
	scatter(failures(i).x,failures(i).y);
end