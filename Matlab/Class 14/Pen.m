classdef Pen
	properties
		color
		width
	end
	
	methods
		function p = Pen(color,width)
			p.color = color;
			p.width = width;
		end
	end
end