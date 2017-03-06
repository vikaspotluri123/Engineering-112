function t = polygon(t,n,length)
	angle = 360 / n;
	disp(angle);
	for i=1:n
		t = t.forward(length);
		t = t.rotate(angle);
	end
end