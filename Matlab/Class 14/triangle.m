function t = triangle(t,side)
	for i = 1:3
		t = t.forward(side);
		t = t.rotate(120);
	end
end