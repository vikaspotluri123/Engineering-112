function [] = writeColors(robot,r,g,b)
	disp(sprintf('Red: %d; Blue %d; Green %d',r,g,b));
	writeLCD(robot,sprintf('Red: %d',r),4,3);
	writeLCD(robot,sprintf('Green: %d',g),5,3);
	writeLCD(robot,sprintf('Blue: %d',b),6,3);
	return;
end