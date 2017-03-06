t = Turtle();
sidelen = 15;
length = 100;
iteration = 0;

while(iteration < 7)
	t.x = -length;
	t.y = -length;
	t.heading = 0;
	t = square(t,length - sidelen/2*iteration);
	length = length - sidelen/2;
	iteration = iteration + 1;
	disp(iteration);
end