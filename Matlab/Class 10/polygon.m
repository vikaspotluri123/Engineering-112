load('polygons.mat');
for i =1:numel(polygons)
	subplot(3,3,i);
	patch(polygons(i).x,polygons(i).y,polygons(i).colorCode);
end