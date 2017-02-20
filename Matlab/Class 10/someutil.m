load('SomeUtility.mat');

disp(fieldnames(failures));

x(1:numel(failures)) = 0;
y(1:numel(failures)) = 0;
distance(1:numel(failures)) = 0;

for i=1:numel(failures)
	x(i) = failures(i).x;
	y(i) = failures(i).y;
	distance(i) = sqrt(x(i)^2 + y(i)^2);
	failures(i).distance = distance(i);
end

scatter(x,y);

[furthest, findex] = max(distance);
fprintf('Furthest Worker was %s\n',failures(findex).LineWorker);

[sortedD, indexD] = sort(distance);

for i=1:numel(failures)
	failuresByDistance(i) = failures(indexD(i));
end