function [] = FFAplot(a,b,k)
	if(numel(a) ~= numel(b) || numel(b) ~= numel(k))
		error('Matrix dimensions MUST match');
	end
	T = logspace(0,2,100);
	P = 1./T;
	for i=1:numel(a)
		A = a(i);
		B = b(i);
		K = k(i);
		y = B + (A/K) * (1 - (-log(1-P)).^K);
		loglog(T,y,'DisplayName',sprintf('stream %d',i));
		%sprintf('Series %d',i);
		hold on;
		grid on;
	end
	axis([0,100,10000,1000000]);
	ylabel('Flood Magnitude (cfs)');
	xlabel('Return Period (yr)');
	title('All graphs must have titles but yours didn''t');
	legend('Show','Location','NorthEast');
end