classdef Turtle
	properties
		x
		y
		heading
		pen_on_paper
		pen_width
		pen_color
	end
	
	methods
		function obj = Turtle()
			obj.x = 0;
			obj.y = 0;
			obj.heading = 90;
			obj.pen_on_paper = true;
			obj.pen_width = 1;
			obj.pen_color = 'black';
		end
		
		function obj = forward(obj,distance)
			x2 = obj.x + distance*(cosd(obj.heading));
			y2 = obj.y + distance*(sind(obj.heading));
			
			if obj.pen_on_paper
				hold on;
				l = line([obj.x x2],[obj.y y2]);
				l.Color = obj.pen_color;
				l.LineWidth = obj.pen_width;
				hold off
				pause(0.1);
			end
			
			obj.x = x2;
			obj.y = y2;
		end
		
		function obj = setPenColor(obj,new_color)
			obj.pen_color = new_color;
		end
		
		function obj = setPenWidth(obj,new_width)
			obj.pen_width = new_width;
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