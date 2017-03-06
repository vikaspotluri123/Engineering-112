function t = square(t,side)
	for i=1:4
		t = t.forward(side);
		t = t.rotate(90);
	end
end