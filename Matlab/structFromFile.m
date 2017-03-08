function [structs] = structFromFile(filename)
	file = load(filename);
	IDs  = file(:,1);
	diams = file(:,2);
	lengths = file(:,3);
	for i = 1:numel(IDs)
		s = struct();
		s.id = IDs(i);
		s.diam = diams(i);
		s.len = lengths(i);
		structs(i) = s;
	end
end