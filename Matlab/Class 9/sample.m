function [mean] = sample(data,ss,number)
	sums = 0;
	for i=1:number
		sum = 0;
		data = rand(ss);
		for j = 1:numel(data)
			sum = sum+data(j);
		end
		sums = sums + sum/ss;
	end
	mean = sums/number;
end