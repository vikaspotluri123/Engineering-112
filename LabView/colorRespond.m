function [] = colorRespond(robot,color,r,g,b,motor)
	switch(color)
		case 0
			rejectMarble(motor);
			writeColors(robot,r,g,b);
		case {1,2,3,4,5,6,7,8}
			acceptMarble(motor);
			writeColors(robot,r,g,b);
		otherwise
			rejectMarble(motor);
			writeColors(robot,r,g,b);
	end
end