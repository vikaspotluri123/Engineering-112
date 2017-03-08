classdef Turtle
	properties
		x
		y
		heading
		pen_on_paper
		pen
	end
	
	methods
		function obj = Turtle()
			obj.x = 0;
			obj.y = 0;
			obj.heading = 90;
			obj.pen_on_paper = true;
			obj.pen = Pen('black',1);
		end
		
		function obj = forward(obj,distance)
			x2 = obj.x + distance*(cosd(obj.heading));
			y2 = obj.y + distance*(sind(obj.heading));
			
			if obj.pen_on_paper
				hold on;
				l = line([obj.x x2],[obj.y y2]);
				l.Color = obj.pen.color;
				l.LineWidth = obj.pen.width;
				hold off
				pause(0.1);
			end
			
			obj.x = x2;
			obj.y = y2;
		end
		
		function obj = fd(obj,distance)
			obj = obj.forward(obj,distance);
		end
		
		function obj = backward(obj,distance)
			obj = obj.forward(obj,-distance);
		end
		
		function obj = bd(obj,distance)
			obj = obj.backward(obj,distance);
		end
		
		function obj = right(obj)
			obj = obj.rotate(-90);
		end
		
		function obj = rt(obj)
			obj = obj.right();
		end
		
		function obj = left(obj)
			obj = obj.rotate(90);
		end
		
		function obj = lt(obj)
			obj = obj.left();
		end
		
		function obj = setPen(obj,new_pen)
			obj.pen = new_pen;
		end
		
		function obj = rotate(obj,angle)
			obj.heading = mod(obj.heading + angle,360);
		end
		
		function obj = penUp(obj)
			obj.pen_on_paper = false;
		end
		
		function obj = pu(obj)
			obj = obj.penUp();
		end
		
		function obj = penDown(obj)
			obj.pen_on_paper = true;
		end
		
		function obj = pd(obj)
			obj = obj.penDown();
		end
		
		function obj = goto(obj,x,y)
			obj.pd();
			obj.x = x;
			obj.y = y;
		end
	end
end