function [] = polyColor(number,color)
	load('polygons.mat');
	for i =1:numel(polygons)
		subplot(3,3,i);
		if(i == number)
			polygons(i).colorCode = color;
		end
		patch(polygons(i).x,polygons(i).y,polygons(i).colorCode);
	end
end