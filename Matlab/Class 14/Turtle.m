classdef Turtle
	properties
		x
		y
		heading
		pen_on_paper
	end
	
	methods
		function obj = Turtle()
			obj.x = 0;
			obj.y = 0;
			obj.heading = 90;
			obj.pen_on_paper = true;
		end
		
		function obj = forward(obj,distance)
			x2 = obj.x + distance*(cosd(obj.heading));
			y2 = obj.y + distance*(sind(obj.heading));
			
			if obj.pen_on_paper
				hold on;
				l = line([obj.x x2],[obj.y y2]);
				l.Color = 'black';
				l.LineWidth = 1;
				hold off
				pause(0.1);
			end
			
			obj.x = x2;
			obj.y = y2;
		end
		
		function obj = rotate(obj,angle)
			obj.heading = mod(obj.heading + angle,360);
		end
		
		function obj = penUp(obj)
			obj.pen_on_paper = false;
		end
		
		function obj = penDown(obj)
			obj.pen_on_paper = true;
		end
	end
end