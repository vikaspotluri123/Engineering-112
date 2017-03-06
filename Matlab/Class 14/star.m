function t = star(t,n,length)
	if(mod(n,2)==0)
		return;
	end
	for i=1:n
		angle = 180 - 180/n;
		t = t.forward(length);
		t = t.rotate(angle);
	end
end